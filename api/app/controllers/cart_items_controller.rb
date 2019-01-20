class CartItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create, :index]

  def index
    cart_items = CartItem.where(cart_id: @cart.id)
    render json: {
      status: :ok,
      cart_items: cart_items
    }
  end

  def show
    render json: {
      status: :ok,
      cart_item: @cart_item
    }
  end

  def edit
    render json: {
      status: :ok,
      cart_item: @cart_item
    }
  end
  
  def new
    @cart_item = CartItem.new
  end
  

  def create
    @product = Product.find(params[:id])
    if @product.inventory_count > 0
      @cart_item = @cart.add_product(@product)
      if @cart_item.save!
        render json: {
          status: :ok,
          message: 'added to cart successfully'
        }
      else
        render json: {
          status: :ok,
          message: 'Error prevents from adding item to cart'
        }
      end
    else 
      render json: {
        status: :ok,
        message: 'No more available'
      }
    end
  end

  def destroy
    product = Product.find(@cart_item.product_id)
    product.update("inventory_count" => product.inventory_count + @cart_item.quantity)
    if @cart_item.destroy
    render json: {
      status: :ok,
      message: 'Removed item from cart'
    }.to_json
    else
      render json: {
        status: :internal_server_error,
        message: 'Error prevents from removing item from cart'
      }
    end
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

end
