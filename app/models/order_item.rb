class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :day_menu_dish
  after_validation :price

  validates :quantity, presence: true, length: {minimum: 1},numericality: true
  validates :number_of_servings, presence: true, length: {minimum: 1},numericality: true
  validates :price, presence: true, length: {minimum: 1},numericality: true
  #validates :order_id, presence: true, length: {minimum: 1},numericality: true
  validates :day_menu_dish_id, presence: true, length: {minimum: 1},numericality: true
  def price 
		if !marked_for_destruction? and errors.empty?
	 		day_price = day_menu_dish.day_price
				if day_menu_dish.dish.pricing_type.is_by_weight?
					self.price = (day_price*quantity*number_of_servings/day_menu_dish.dish.units).round(2)
				else
					self.price = (number_of_servings*quantity*day_price).round(2)
				end
		end
  	end
end
