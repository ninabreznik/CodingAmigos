namespace :users do
  desc "Set country for users"
  task :set_country => :environment do
    User.all.tap{|users| puts "Found #{users.size} users to work on"}.each do |user|
      User.all.each do |user|
        user.update(country: "Slovenia")
      end     
    end
  end
end