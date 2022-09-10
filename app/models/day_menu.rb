class DayMenu < ApplicationRecord
	has_many :day_menu_dishes, dependent: :destroy
	has_many :dishes, through: :day_menu_dishes
	has_many :orders
	validates :date,presence:true,length:{minimum:8}
  accepts_nested_attributes_for :day_menu_dishes, allow_destroy: true, reject_if: :all_blank
  validates_associated :day_menu_dishes
  def dishes_grouped_by_categories
    day_menu_dishes.includes(dish: [:category,:pricing_type,:measure])
                    .group_by{|t| t.dish.category}
  end


end

