class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :product_id, presence: :true
  validates :cart_id, presence: :true

  def total_price
    product.price.to_i * quantity.to_i
  end
end
