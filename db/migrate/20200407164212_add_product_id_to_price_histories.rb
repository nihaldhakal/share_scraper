class AddProductIdToPriceHistories < ActiveRecord::Migration[5.2]
  def up
    add_reference :price_histories, :share, foreign_key: true
  end

  def down
    add_reference :price_histories, :share, foreign_key: true
  end
end
