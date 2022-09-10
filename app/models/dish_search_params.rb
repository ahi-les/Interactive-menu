class DishSearchParams
	include ActiveModel::Model

	attr_accessor :dish
	attr_accessor :category
	attr_accessor :pricing_type
	attr_accessor :records_number
	attr_accessor :sort_by_field
	attr_accessor :order_by

	FIELDS = {
		  	#"date"  => "date",
		  	#"day_price"  => "day_price",
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
		self.dish = params[:dish] if params.key?(:dish)
		self.category = params[:category] if params.key?(:category)
		self.pricing_type = params[:pricing_type] if params.key?(:pricing_type)

		self.records_number = params[:records_number].to_i || DEFAULT_LIMIT
		self.sort_by_field = FIELDS[params[:sort_by_field]] || FIELDS.values.first
		self.order_by = ORDER[params[:order_by]]  || :desc

   	end

	def apply_filters(collection)
      	collection = collection.by_name(dish) unless dish.blank?
      	collection = collection.by_category_name(category)  unless category.blank?
      	collection = collection.by_pricing_type(pricing_type) unless pricing_type.blank?

      	collection = collection.sort_by_field(sort_by_field,order_by)

		collection
	end
end