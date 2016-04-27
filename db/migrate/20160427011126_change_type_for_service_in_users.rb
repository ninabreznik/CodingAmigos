class ChangeTypeForServiceInUsers < ActiveRecord::Migration
  def change
    change_column :users, :service, :text
  end
end
