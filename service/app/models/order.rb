class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, cash: 1 }
  enum order_status: { waiting_payment: 0, payment_confirmation: 1, in_production: 2, preparing_to_ship: 3, shipped: 4 }
end
