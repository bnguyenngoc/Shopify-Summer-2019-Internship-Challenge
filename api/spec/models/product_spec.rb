require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has a valid factory' do
    expect(build(:product)).to be_valid  
  end

  let(:attributes) do
    {
      title: 'A test title',
      price: '12.34',
      inventory_count: '6'
    }
  end

  let(:product) { create(:product, **attributes)}

  context 'validation tests' do
    # check that the title field received the right values
    it { expect(product).to allow_value(attributes[:title]).for(:title) }
    # ensure that the title field is never empty
    it { expect(product).to validate_presence_of(:title) }
    # ensure that the title is unique for each todo list
    it { expect(product).to validate_uniqueness_of(:title)}
    # check that the price field received the right values
    it { expect(product).to allow_value(attributes[:price]).for(:price) }
    # ensure that the price field is never empty
    it { expect(product).to validate_presence_of(:price) }
    # check that the inventory_count field received the right values
    it { expect(product).to allow_value(attributes[:inventory_count]).for(:inventory_count) }
    # ensure that the title field is never empty
    it { expect(product).to validate_presence_of(:inventory_count) }
  end

end
