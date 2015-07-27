class AddTitleToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :title, :string
  end
end
