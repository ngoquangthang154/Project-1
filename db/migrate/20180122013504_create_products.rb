class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :trademark, foreign_key: true
      t.references :assort, foreign_key: true
      t.string :name
      t.string :img_detail
      t.text :content
      t.decimal :price
      t.integer :status
      t.string :keys
      t.decimal :star

      t.timestamps
    end
    add_index :products, [:assort_id, :created_at]
    add_index :products, [:trademark_id, :created_at]
  end
end
