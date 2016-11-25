class RenameDeBioToUsername < ActiveRecord::Migration
  def change
    rename_column :users, :de_bio, :username
  end
end
