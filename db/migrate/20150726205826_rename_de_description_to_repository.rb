class RenameDeDescriptionToRepository < ActiveRecord::Migration
  def change
    rename_column :projects, :de_description, :repository
  end
end
