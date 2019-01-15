class ProductsController < ApplicationController
  def query
    result = Schema.execute(
      params[:query]
    )
    render json: result
  end

  def get
    result = Product.all
    render json: result
  end
end
