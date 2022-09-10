class DishesController < ApplicationController
	before_action :authenticate_admin!, except: %i[show index]
	before_action :set_dish, only: %i[show destroy edit update]

	def show
		respond_to do |format|
    	format.html
    	format.json { render :json => @dish.to_json(:include => [:measure,:pricing_type])}
    end
	end

	def destroy
		@dish.destroy
		flash[:success] = "Dish deleted!"
		redirect_to dishes_path
	end

	def edit
	end

	def update
		if @dish.update dish_params
			flash[:success] = "Dish updated!"
			redirect_to dishes_path
		else
			render :edit
		end
	end

	def index

		@dishes = Dish.all.order('category_id')
		@search = SearchParams.new(params[:search_params] || {})
		@dishes = @search.dish_apply_filters(@dishes)
		@pagy, @dishes = pagy @dishes
		

	end

	def new
		@dish = Dish.new
	end

	def create
		@dish = Dish.new dish_params
		if @dish.save
			flash[:success] = "Dish created!"
			redirect_to dishes_path
		else
			render :new
		end
	end

	private

	def dish_params
		params.require(:dish).permit(:name, :units, :dish_price, :category_id, :measure_id, :pricing_type_id)
	end

	def set_dish
		@dish = Dish.find params[:id]
	end
end