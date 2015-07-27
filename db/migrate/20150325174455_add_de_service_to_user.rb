class AddDeServiceToUser < ActiveRecord::Migration
  def change
    add_column :users, :de_service, :string
  end
end
