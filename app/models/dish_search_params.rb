class DishSearchParams
	include ActiveModel::Model

	attr_accessor :dish
	attr_accessor :category
	attr_accessor :pricing_type
	attr_accessor :date_less
	attr_accessor :date_greater
	attr_accessor :records_number
	attr_accessor :sort_by_field
	attr_accessor :order_by

	FIELDS = {
		  	"date"  => "date",
		  	"day_price"  => "day_price",
		  	"dishes.name"  => "dishes.name",
		  	"dishes.units"  => "dishes.units"
	}
	ORDER = {
		  	"desc"  => :desc,
		  	"asc"  => :asc,
		  	"DESC"  => :desc,
		  	"ASC"  => :asc
	}
	DEFAULT_LIMIT = 1

	def initialize(params)
		self.dish = (params[:dish]) if params.key?(:dish)
		self.category = (params[:category]) if params.key?(:category)
		self.pricing_type = (params[:pricing_type]) if params.key?(:pricing_type)
		self.date_less = params[:date_less] if params.key?(:date_less)
		self.date_greater = params[:date_greater] if params.key?(:date_greater)

		self.records_number = params[:records_number].to_i || DEFAULT_LIMIT
		self.sort_by_field = FIELDS[params[:sort_by_field]] if params.key?(:sort_by_field)
		self.order_by = ORDER[params[:order_by]] if params.key?(:order_by)

   	end

	def apply_filters(collection)
      	collection = collection.by_dish(dish) unless dish.blank?
      	collection = collection.by_date_less(date_less)  unless date_less.blank?
      	collection = collection.by_date_greater(date_greater)  unless date_greater.blank?

      	collection = collection.limit(records_number) unless date_greater.blank?
      	collection = collection.sort_by_field(sort_by_field,order_by) unless date_greater.blank?

		collection
	end
end