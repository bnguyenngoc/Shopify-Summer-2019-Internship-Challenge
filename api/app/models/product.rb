class Product < ApplicationRecord
    has_many :cart_items

    scope :available, -> { where("inventory_count > ?", 0)}
    # Ex:- scope :active, -> {where(:active => true)}
    validates :title, presence: true, uniqueness: true
    validates :price, presence: true
    validates :inventory_count, presence: true

end
