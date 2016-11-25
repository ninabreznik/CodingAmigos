class RenameCompanyToCurrentlyWorkingOn < ActiveRecord::Migration
  def change
    rename_column :users, :company, :currently_working_on
  end
end
