# frozen_string_literal: true

class DeviseCreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.boolean :membership_status, null: false, default: true

      t.timestamps
    end

    add_index :customers, :email, unique: true
    add_index :customers, :reset_password_token, unique: true
  end
end
