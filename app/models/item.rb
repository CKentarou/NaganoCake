class Item < ApplicationRecord
    belongs_to :genre
    has_many :cart_items, dependent: :destroy
    has_many :order_details, dependent: :destroy
  
    has_one_attached :image
  
    enum sales_status: { 販売中: true, 販売停止中: false }
end 