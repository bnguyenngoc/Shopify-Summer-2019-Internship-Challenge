class Cart < ApplicationRecord
    has_many :cart_items, dependent: :destroy

    def add_product(product)
        current_item = CartItem.find_by(product_id: product.id)
        if current_item.present?
            current_item.increment(:quantity)
            render json: {
                status: 200,
                message: 'Product added to cart!'
            }
        else
            current_item = CartItem.build(product_id: product.id)
        end
    end

    def total_price
        cart_items.to_a.sum { |item| item.total_price }
    end


    enum %i[progress done cancelled]


end
