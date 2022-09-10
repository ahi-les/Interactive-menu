class Order < ApplicationRecord
  belongs_to :day_menu
  has_many :order_items, dependent: :destroy

  accepts_nested_attributes_for :order_items, allow_destroy: true
  validates_associated :order_items
  
  validates :total_price, presence: true, length: {minimum: 1},numericality: { greater_than: 0 }
  validates :day_menu_id, presence: true, length: {minimum: 1},numericality: true
  def total_price
  	self.total_price = order_items.reject(&:marked_for_destruction?).sum(&:price).round(2);
  end
end
