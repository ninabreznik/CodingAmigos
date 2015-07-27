namespace :users do
  desc "Translate user.business_type from slovene to english"
  task :translate_user_business_type => :environment do
    User.all.tap{|users| puts "Found #{users.size} users to work on"}.each do |user|
      if user.business_type == "Izvajalci splošnih gradbenih del"
        user.update(business_type: "General Home Builders")       
      elsif user.business_type == "Načrtovalci okolice"
        user.update(business_type: "Landscape Architects & Garden Designers")
      end     
    end
  end
end