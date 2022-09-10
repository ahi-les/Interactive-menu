class MenuController < ApplicationController
	def index
    @dishes_grouped_by_categories = Dish.includes(:category).group_by{|t|t.category.name}
  end
end