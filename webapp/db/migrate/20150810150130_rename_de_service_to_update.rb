class RenameDeServiceToUpdate < ActiveRecord::Migration
  def change
    rename_column :users, :de_service, :update
  end
end
