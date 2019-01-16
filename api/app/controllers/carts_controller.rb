class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:destroy]

  def create
    @cart = Cart.new(cart_params)
    if @cart.save!
      render json: {
        status: 200,
        message: 'Cart created successfully'
      }
    else
      render json: {
        status: 500,
        message: 'Error creating cart'
      }
    end
  end

  def destroy
    if @cart.id == session[:cart_id]
      @cart.destroy
      render json: {
        status: 200,
        message: 'Cart closed'
      }
    else
      render json: {
        status: 200,
        message: 'Can\'t destroy someone else\'s cart'
      }
    end
  end

  private

  def cart_params
    params.fetch(:cart, {})
  end
end
