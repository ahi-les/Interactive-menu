
class DayMenuDishesController < ApplicationController


  def index
    @day_menu_dishes = DayMenuDish.all
    @search = SearchParams.new(params || {})
    @day_menu_dishes = @search.apply_filters(@day_menu_dishes)
    respond_to do |format|
        format.html
        format.json { render :json => @day_menu_dishes.to_json(:include => [:dish  =>{ :include => [:measure,:pricing_type]},:day_menu =>{}])}
    end
  end
end