class AddAttachmentPictureToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :projects, :picture
  end
end
