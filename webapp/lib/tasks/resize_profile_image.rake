namespace :users do
  desc "Resize user profile images"
  task :resize_images => :environment do
    User.all.tap{|users| puts "Found #{users.size} users to work on"}.each do |user|
      user.picture.reprocess!
    end
  end
end
