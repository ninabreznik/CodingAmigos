namespace :projects do
  desc "Resize user profile images"
  task :resize_images => :environment do
    Project.all.tap{|project| puts "Found #{project.size} projects to work on"}.each do |project|
      project.picture.reprocess!
    end
  end
end
