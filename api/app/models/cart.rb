class Cart < ApplicationRecord
    before_destroy :add_inventory_count
    has_many :cart_items, dependent: :destroy

    validates :status, presence: true
    # adding a product here follows the principle of "reserving a product"
    # a product's inventory count will be decremented when adding into the shopping cart
    # upon cancellation or destruction of the cart_item, we will re-increment
    def add_product(product)
        current_item = cart_items.find_by(product_id: product.id)
        if current_item.present?
                current_item.increment(:quantity)
                product.decrement!(:inventory_count)
                render json: {
                    status: :ok,
                    message: 'Product added to cart!'
                }
        else
            current_item = cart_items.build(product_id: product.id)
        end
    end

    def total_price
        cart_items.to_a.sum { |item| item.total_price }
    end


    enum status: %i[progress done]

    private

    def add_inventory_count
        cart_items.each do |item|
            product = Product.find(item.product_id)
            product.update("inventory_count" => product.inventory_count + item.quantity)
        end
    end

end
