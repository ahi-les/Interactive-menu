class OrdersController < ApplicationController
	before_action :authenticate_admin!, except: %i[show index]
	before_action :set_order, only: %i[show destroy edit update]

	def show
		@order_grouped_by_categories = @order.order_items.includes(day_menu_dish: {dish: [:category,:pricing_type,:measure]}).group_by{|t|t.day_menu_dish.dish.category.name}
	end

	def destroy
		@order.destroy
		flash[:success] = "Order deleted!"
		redirect_to orders_path
	end

	def edit
	end

	def update
		if @order.update order_params
			flash[:success] = "Order updated!"
			redirect_to orders_path
		else
			render :edit
		end
	end

	def index
		@pagy, @orders = pagy Order.all
	end

	def new
		@order = Order.new(day_menu_id: params[:day_menu_id])
		
	end

	def create
		@opder = Order.new order_params

		if @opder.save
			flash[:success] = "Order created!"
			redirect_to orders_path
		else
			render :new
		end
	end


	private

	def order_params
		params.require(:order).permit(:total_price,:day_menu_id,order_items_attributes: OrderItem.attribute_names.map(&:to_sym).push(:_destroy))
	end

	def set_order
		@order = Order.find(params[:id]) if params[:id]
	end
end