class AddProductIdToEarningsPerShares < ActiveRecord::Migration[5.2]
  def up
    add_reference :earnings_per_shares, :share, foreign_key: true
  end

  def down
    add_reference :earnings_per_shares, :share, foreign_key: true
  end
end
