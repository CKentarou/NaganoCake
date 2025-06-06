class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :shipping_postal_code, null: false
      t.string :shipping_address, null: false
      t.string :shipping_name, null: false
      t.integer :shipping_fee, null: false
      t.integer :billing_amount, null: false
      t.integer :payment_method, null: false
      t.integer :order_status, null: false, default: 0
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
