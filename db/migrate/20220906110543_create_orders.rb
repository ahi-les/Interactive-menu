class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :total_price
      t.belongs_to :day_menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
