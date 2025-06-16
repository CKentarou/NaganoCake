class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.text :description, null: false
      t.string :name, null: false
      t.integer :price_excluding_tax, null: false
      t.boolean :sales_status, null: false, default: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
