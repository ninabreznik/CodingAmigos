namespace :users do
  desc "Add Slovenia to user.country"
  task :add_slovenia => :environment do
    User.all.tap{|users| puts "Found #{users.size} users to work on"}.each do |user|
      user.country = "Slovenia"
    end
  end
end