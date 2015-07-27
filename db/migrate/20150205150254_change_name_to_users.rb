class ChangeNameToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :name, :first_name
  end
end


