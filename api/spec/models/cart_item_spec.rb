require 'rails_helper'

RSpec.describe CartItem, type: :model do
  context 'validation tests' do
    it 'ensures product presence' do
      cart = Cart.create!
      cart_item = CartItem.new(cart_id: cart.id).save
      expect(cart_item).to eq(false)
    end

    it 'ensures valid product' do
      cart = Cart.create!
      cart_item = CartItem.new(cart_id: cart.id, product_id: 6).save
      expect(cart_item).to eq(false) 
    end

    it 'ensures cart presence' do
      product = Product.create!(title: 'Product', price: '4.2', inventory_count: '6')
      cart_item = CartItem.new(product_id: product.id).save
      expect(cart_item).to eq(false)
    end

    it 'ensures valid product' do
      product = Product.create!(title: 'Product', price: '4.2', inventory_count: '6')
      cart_item = CartItem.new(cart_id: 6, product_id: product.id).save
      expect(cart_item).to eq(false) 
    end


  end
end