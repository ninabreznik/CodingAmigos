class AddUserIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :user_id, :integer
  end
end
