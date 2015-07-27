class AddServicesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :service, :string
  end
end
