class RenameEpsValueInEarningsPerShare < ActiveRecord::Migration[5.2]
  def up
    rename_column :earnings_per_shares, :eps_value, :value
  end

  def down
    rename_column :earnings_per_shares, :value, :eps_value
  end
end
