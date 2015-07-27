class AddDeDescriptionToProject < ActiveRecord::Migration
  def change
    add_column :projects, :de_description, :string
  end
end
