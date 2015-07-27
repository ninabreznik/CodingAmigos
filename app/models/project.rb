class Project < ActiveRecord::Base
  belongs_to :user
  has_many :likes, as: :likeable
  # attr_accessible :picture
  validates :email, presence: true, format: {with: /.+@.+\..+/i}

  has_attached_file :picture, :styles => { :full => "1400x1400>", :large => "500x500>", :medium => "250x250>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_size :picture, less_than: 1.megabytes
  validates_attachment_content_type :picture, content_type: ["image/jpeg", "image/png", "image/jpg", "image/bmp"]
  validates :picture_file_name, length: { maximum: 150 }
end
