class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.decimal :price_detail
      t.decimal :price_total

      t.timestamps
    end
    add_index :order_details, [:order_id, :created_at]
    add_index :order_details, [:product_id, :created_at]
  end
end
