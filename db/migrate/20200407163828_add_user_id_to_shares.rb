class AddUserIdToShares < ActiveRecord::Migration[5.2]
  def up
    add_reference :shares, :user, foreign_key: true
  end

  def down
    add_reference :shares, :user, foreign_key: true
  end

end
