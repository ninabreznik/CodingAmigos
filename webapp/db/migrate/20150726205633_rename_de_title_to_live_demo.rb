class RenameDeTitleToLiveDemo < ActiveRecord::Migration
  def change
    rename_column :projects, :de_title, :live_demo
  end
end
