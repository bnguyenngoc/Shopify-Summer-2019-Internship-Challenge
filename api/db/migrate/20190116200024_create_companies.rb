class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.text :name
      t.decimal :money, default: 0

      t.timestamps
    end
  end
end
