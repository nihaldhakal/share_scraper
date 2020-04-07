class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.string :share_name
      t.string :url
      t.float :price_to_earning

      t.timestamps
    end
  end
end
