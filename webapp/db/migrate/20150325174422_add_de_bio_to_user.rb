class AddDeBioToUser < ActiveRecord::Migration
  def change
    add_column :users, :de_bio, :string
  end
end
