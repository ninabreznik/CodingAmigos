class AddLinksToLead < ActiveRecord::Migration
  def change
    add_column :leads, :link, :string
  end
end
