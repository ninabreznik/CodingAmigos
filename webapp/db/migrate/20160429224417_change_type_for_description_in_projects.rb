class ChangeTypeForDescriptionInProjects < ActiveRecord::Migration
  def change
    change_column :projects, :description, :text
  end
end
