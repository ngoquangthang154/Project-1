class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.references :typenew, foreign_key: true
      t.string :title
      t.string :description
      t.string :img_thumb
      t.text :content
      t.datetime :day_create

      t.timestamps
    end
    add_index :news, [:typenew_id, :created_at]
  end
end
