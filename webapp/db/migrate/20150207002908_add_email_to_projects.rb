class AddEmailToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :email, :string
  end
end
