class CreateAssorts < ActiveRecord::Migration[5.1]
  def change
    create_table :assorts do |t|
      t.string :name

      t.timestamps
    end
  end
end
