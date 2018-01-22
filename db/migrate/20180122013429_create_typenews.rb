class CreateTypenews < ActiveRecord::Migration[5.1]
  def change
    create_table :typenews do |t|
      t.string :name

      t.timestamps
    end
  end
end
