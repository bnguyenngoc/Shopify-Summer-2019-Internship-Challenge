class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show, :update, :destroy]

  # show current cart
  # GET    /carts/:id
  def show
    @cart_items = CartItem.where(cart_id: @cart.id)
    render json: {
      status: :ok,
      cart: @cart,
      cart_items: @cart_items,
      total_price: @cart.total_price
    }
  end

  # create a new cart
  # POST   /carts
  def create
    @cart = Cart.new(cart_params)
    if @cart.save!
      session[:cart_id] = @cart.id
      render json: {
        status: :ok,
        message: 'Cart created successfully'
      }
    else
      render json: {
        status: :internal_server_error,
        message: 'Error creating cart'
      }
    end
  end

  # updates cart
  # PATCH  /carts/:id
  def update
    if @cart.update(cart_params)
      render json: {
        status: :ok,
        message: 'Updated cart successfully'
      }
    else
      render json: {
        status: :internal_server_error,
        message: 'Error updating cart'
      }
    end
  end


  # destroys current cart
  # DELETE /carts/:id
  def destroy
    if @cart.id == session[:cart_id]
      @cart.destroy
      session[:cart_id] = nil
      render json: {
        status: :ok,
        message: 'Cart was successfully destroyed'
      }
    else
      render json: {
        status: :ok,
        message: 'Can only destroy current cart'
      }
    end
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:status)
  end
end
