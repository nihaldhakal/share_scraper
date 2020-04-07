class CreateEarningsPerShares < ActiveRecord::Migration[5.2]
  def change
    create_table :earnings_per_shares do |t|
      t.string :quarter
      t.float :eps_value
      t.date :year

      t.timestamps
    end
  end
end
