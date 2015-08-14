class Project < ActiveRecord::Base
  belongs_to :user
  has_many :likes, as: :likeable
  # attr_accessible :picture
  validates :email, presence: true, format: {with: /.+@.+\..+/i}
  validates :title, presence: true

  has_attached_file :picture,
                    :styles => { :full => "1400x1400>", :large => "400x400>", :medium => "250x250>", :thumb => "100x100>" },
                    # :default_url => "/images/:style/missing.png",
                    :storage => :s3
                    # :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  # def s3_credentials
  #   { :access_key_id  => 'AWS_ACCESS_KEY_ID',
  #     :secret_access_key => 'AWS_SECRET_ACCESS_KEY',
  #     :bucket => 'S3_BUCKET'
  #   }
  # end

  validates_attachment_size :picture, less_than: 1.megabytes
  validates_attachment_content_type :picture, content_type: ["image/jpeg", "image/png", "image/jpg", "image/bmp", "image/svg"]
  validates :picture_file_name, length: { maximum: 150 }



end
