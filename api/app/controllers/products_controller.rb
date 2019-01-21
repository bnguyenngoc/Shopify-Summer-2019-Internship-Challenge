class ProductsController < ApplicationController

  # querys all products through GraphQL
  # POST   /query
  def query
    result = Schema.execute(
      params[:query]
    )
    render json: result
  end

  # returns one specific product
  # GET    /products/:id
  def show
    result = Product.find(params[:id])
    render json: {
      status: :ok,
      product: result
    } 
  end

  # if the parameter "available" is set to true (ex. the JSON object sent is {"avaiable": true} ),
  # the result will only return the products that have an inventory count superior to 0
  # GET    /products
  def index
    result = params[:available] ? Product.where("inventory_count > ?", 0) : Product.all
    if result.present?
    render json: {
      status: :ok,
      products: result
    }
    else 
      render json: {
        status: :ok,
        message: 'All stocks depleted'
      }
    end 
  end

  # purchase_one is used outside of the context of a shopping cart. It decrements the
  # product by 1
  # PUT    /purchase/:id
  def purchase_one
    product = Product.find(params[:id])
    company = Company.first
    if product[:inventory_count] > 0
      if product.decrement!(:inventory_count)
        total = company[:money] + product[:price]

        company.update_!(money: total)
        render json: {
          status: :ok,
          message: 'Successfully bought'
        }.to_json
      else
        render json: {
          status: :internal_server_error,
          message: 'Error purchasing product'
        }
      end
    else
      render json: {
        status: :ok,
        message: 'Item is no longer available'
      } 
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :inventory_count)
  end

end
