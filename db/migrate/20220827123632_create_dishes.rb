class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :units
      t.float :dish_price
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :measure, null: false, foreign_key: true
      t.belongs_to :pricing_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
