class RenameShareNameInShare < ActiveRecord::Migration[5.2]
  def up
    rename_column :shares, :share_name, :name
  end

  def down
    rename_column :shares, :name, :share_name
  end
end
