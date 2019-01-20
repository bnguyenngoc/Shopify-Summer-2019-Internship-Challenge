require 'rails_helper'

RSpec.describe Cart, type: :model do

  context 'validation tests' do

    it 'should save successfully ' do
      cart = Cart.new().save
      expect(cart).to eq(true)
    end
  end

  context 'scope tests' do
  end
end
