class CreateTrademarks < ActiveRecord::Migration[5.1]
  def change
    create_table :trademarks do |t|
      t.string :name

      t.timestamps
    end
  end
end
