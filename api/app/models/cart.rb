class Cart < ApplicationRecord
    has_many :cart_items

    def add_product(product_params)
        
    end
    enum %i[progress done cancelled]


end
