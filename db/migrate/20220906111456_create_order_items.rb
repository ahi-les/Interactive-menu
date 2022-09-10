class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :number_of_servings
      t.float :price
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :day_menu_dish, null: false, foreign_key: true

      t.timestamps
    end
  end
end
