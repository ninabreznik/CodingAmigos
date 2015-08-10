class RenameUpdateToStatusUpdates < ActiveRecord::Migration
  def change
    rename_column :users, :update, :status_updates
  end
end
