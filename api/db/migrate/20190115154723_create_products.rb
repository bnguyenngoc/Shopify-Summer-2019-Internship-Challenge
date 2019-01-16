class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :title
      t.decimal :price
      t.integer :inventory_count, default: 0

      t.timestamps
    end
  end
end
