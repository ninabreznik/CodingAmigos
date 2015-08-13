class Project < ActiveRecord::Base
  belongs_to :user
  has_many :likes, as: :likeable
  # attr_accessible :picture
  validates :email, presence: true, format: {with: /.+@.+\..+/i}
  validates :title, presence: true

  has_attached_file :picture,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png",
                    :storage => :s3,
                    :s3_credentials => {  :access_key_id  => ENV['AWS_ACCESS_KEY_ID'],
                                          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
                                          :bucket => ENV['S3_BUCKET'] }
                                           
  validates_attachment_size :picture, less_than: 1.megabytes
  validates_attachment_content_type :picture, content_type: ["image/jpeg", "image/png", "image/jpg", "image/bmp"]
  validates :picture_file_name, length: { maximum: 150 }
end
