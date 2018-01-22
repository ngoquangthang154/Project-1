class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :rate

      t.timestamps
    end
    add_index :rates, [:user_id, :created_at]
    add_index :rates, [:product_id, :created_at]
  end
end
