class ProductsController < ApplicationController
  def query
    result = Schema.execute(
      params[:query]
    )
    render json: result
  end

  def get_one
    result = Product.find(params[:id])
    render json: {
      status: 200,
      product: result
    }.to_json  
  end

  def get
    result = Product.all
    render json: {
      status: 200,
      products: result
    }.to_json
  end

  def get_available
    result = Product.where("inventory_count > ?", 0)
    if result.present?
      render json: {
        status: 200,
        products: result
      }.to_json
    else
      render json: {
        status: 200,
        message: 'All stocks depleted'
      }
    end
    
  end

  def purchase_one
    product = Product.find(params[:id])
    company = Company.first
    if product[:inventory_count] > 0
      if product.decrement!(:inventory_count)
        total = company[:money] + product[:price]

        company.update_!(money: total)
        render json: {
          status: 200,
          message: 'Successfully bought'
        }.to_json
      else
        render json: {
          status: 500,
          message: 'Error purchasing product'
        }
      end
    else
      render json: {
        status: 200,
        message: 'Item is no longer available'
      } 
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :inventory_count)
  end

end
