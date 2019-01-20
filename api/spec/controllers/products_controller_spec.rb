require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

    context 'Get #index' do
        it 'returns a success response' do
            get :index
            expect(response).to be_success  
        end
    end

    context 'Get #show' do
        it 'returns a success response' do
            product = Product.create!(title: 'A product', price: '4.20', inventory_count: '42')
            get :show, params: { id: product.to_param}
            expect(response).to be_success  
        end
    end
end
