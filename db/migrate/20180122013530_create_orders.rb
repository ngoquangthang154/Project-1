class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :oder_code
      t.datetime :date_purchase
      t.string :content
      t.string :adress
      t.decimal :price
      t.string :phone

      t.timestamps
    end
    add_index :orders, [:user_id, :created_at]
  end
end
