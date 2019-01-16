class Product < ApplicationRecord
    has_many :cart_items

    validates :title, presence: true, uniqueness: true
    validates :price, presence: true
    validates :inventory_count, presence: true
end
