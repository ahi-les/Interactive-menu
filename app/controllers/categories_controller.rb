class CategoriesController < ApplicationController
	before_action :authenticate_admin!, except: %i[show index]
	before_action :set_category, only: %i[show destroy edit update]
	def show
		@dishes = Dish.all.where(category_id: params[:id])
	end

	def destroy
		@category.destroy
		flash[:success] = "Category deleted!"
		redirect_to categories_path
	end

	def edit
	end

	def update
		if @category.update category_params
			flash[:success] = "Category updated!"
			redirect_to categories_path
		else
			render :edit
		end
	end

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new category_params
		if @category.save
			flash[:success] = "Category created!"
			redirect_to categories_path
		else
			render :new
		end
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end

	def set_category
		@category = Category.find params[:id]
	end
end