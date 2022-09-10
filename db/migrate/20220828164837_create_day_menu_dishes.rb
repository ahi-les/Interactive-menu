class CreateDayMenuDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :day_menu_dishes do |t|
      t.float :day_price
      t.belongs_to :day_menu, null: false, foreign_key: true
      t.belongs_to :dish, null: false, foreign_key: true

      t.timestamps
    end
  end
end
