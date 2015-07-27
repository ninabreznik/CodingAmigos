class AddAttachmentPictureToLeads < ActiveRecord::Migration
  def self.up
    change_table :leads do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :leads, :picture
  end
end
