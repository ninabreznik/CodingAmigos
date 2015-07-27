class AddDeTitleToProject < ActiveRecord::Migration
  def change
    add_column :projects, :de_title, :string
  end
end
