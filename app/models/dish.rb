class Dish < ApplicationRecord
	has_many :day_menu_dishes
	has_many :day_menus, through: :day_menu_dishes

	belongs_to :category
  belongs_to :measure
  belongs_to :pricing_type

  validates :name, presence: true, length: {minimum: 2}
  validates :units, presence: true, length: {minimum: 1}
  validates :dish_price, presence: true, length: {minimum: 1}
  validates :category_id, presence: true, length: {minimum: 1}
  validates :measure_id, presence: true, length: {minimum: 1}
  validates :pricing_type_id, presence: true, length: {minimum: 1}

  def self.by_name(dish)
    where("dishes.name LIKE ? ", "%#{dish}%")
  end

  def self.by_category_name(category)
    joins(:category).where("categories.name LIKE ? ", "%#{category}%")
  end

  def self.by_pricing_type(pricing_type)
    joins(:pricing_type).where("pricing_types.id =  #{pricing_type}")
  end

  def self.sort_by_field(sort_by_field)
    order(sort_by_field)
  end

  def self.sort_by_order(order_by)
    order(order_by)
  end
end
