class CartItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def create
    @product = Product.find(params[:id])
    @cart_item = @cart.add_product(@product)

    if @cart_item.save!
      render json: {
        status: 200,
        message: 'added to cart successfully'
      }.to_json
    else
      render json: {
        status: 500,
        message: 'Error prevents from adding item to cart'
      }
    end
  end

  def destroy
    if @cart_item.destroy
    render json: {
      status: 200,
      message: 'Removed item from cart'
    }.to_json
    else
      render json: {
        status: 500,
        message: 'Error prevents from removing item from cart'
      }
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id)
  end
end
