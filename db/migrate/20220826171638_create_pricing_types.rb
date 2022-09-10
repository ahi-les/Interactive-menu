class CreatePricingTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :pricing_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
