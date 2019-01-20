require 'rails_helper'

RSpec.describe Company, type: :model do

    context 'validation tests' do
        it 'should save successfully' do
            company = Company.new(name: 'Boring Company', money: 0).save
            expect(company).to eq(true)
        end
    end
end
