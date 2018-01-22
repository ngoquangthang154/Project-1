class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.string :comment
      t.datetime :time_cmt
      t.integer :reply

      t.timestamps
    end
    add_index :comments, [:user_id, :created_at]
    add_index :comments, [:product_id, :created_at]
  end
end
