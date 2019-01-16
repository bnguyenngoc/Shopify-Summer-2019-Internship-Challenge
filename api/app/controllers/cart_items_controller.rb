class CartItemsController < ApplicationController
  before_action :set_cart

  def create
    @cart.add_product(params)

    if @cart.save
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

end
