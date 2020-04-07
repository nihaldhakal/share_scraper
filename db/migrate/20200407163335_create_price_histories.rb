class CreatePriceHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :price_histories do |t|
      t.date :date
      t.float :ltp
      t.float :change
      t.float :high
      t.float :low
      t.float :open
      t.integer :qty
      t.float :turnover

      t.timestamps
    end
  end
end
