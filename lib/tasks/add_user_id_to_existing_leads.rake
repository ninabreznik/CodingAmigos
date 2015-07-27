namespace :leads do
  desc "Add user_id to leads already in the database"
  task :add_user_id => :environment do
    Lead.where(user_id: nil).tap{|leads| puts "Found #{leads.size} leads to work on"}.each do |lead|
      user = User.find_by_email(lead.email)
      if user
        lead.user_id = user.id
        lead.save
        puts "#{lead.id} OK"
      else
        puts "For this lead #{lead.id} and email address #{lead.email} there is no match."
      end
    end
  end
end