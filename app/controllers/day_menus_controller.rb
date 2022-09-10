
class DayMenusController < ApplicationController
	before_action :authenticate_admin!, except: %i[show index]
	before_action :set_day_menu, only: %i[show destroy edit update]
	def show
		@day_menu_grouped_by_categories = @day_menu.day_menu_dishes.includes(dish: :category).group_by{|t|t.dish.category.name}
	end

	def destroy
		@day_menu.destroy
		flash[:success] = "Day menu deleted!"
		redirect_to day_menus_path
	end

	def edit
	end

	def update
		if @day_menu.update day_menu_params
			flash[:success] = "Day menu updated!"
			redirect_to day_menus_path
		else
			render :edit
		end
	end

	def index
		@pagy, @day_menus = pagy DayMenu.all
	end

	def new
		@day_menu = DayMenu.new
		@day_menu.day_menu_dishes = []
	end

	def create
		@day_menu = DayMenu.new day_menu_params

		if @day_menu.save
			flash[:success] = "Day menu created!"
			redirect_to day_menus_path
		else
			render :new
		end
	end

	private

	def day_menu_params
		params.require(:day_menu).permit(:id,:date,day_menu_dishes_attributes: DayMenuDish.attribute_names.map(&:to_sym).push(:_destroy))
	end

	def set_day_menu
		@day_menu = DayMenu.find params[:id]
	end
end