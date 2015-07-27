namespace :users do
  desc "Send the first in app message to users already in database"
  task :send_first_message => :environment do
    User.all.tap{|users| puts "Found #{users.size} leads to work on"}.each do |user|
    beta = user
    if user.country == "Slovenia"
      User.find_by_id(1).send_message(beta, "Pozdravljeni, vsakič ko se bo nekdo zanimal za vaš projekt oz. sodelovanje z vami, vas bomo obvestili. Vsa prejeta in poslana sporočila najdete med Vašimi sporočili.", ":)")
    else
      User.find_by_id(1).send_message(beta, "Hi, this is Nina from ZweiDesign. Congrats on creating your account. I noticed you haven't set up your profile. The longer you wait, the more clients you're missing out on. Log in, add your information, and upload the best three examples of your work (projects). Once you do, I'll have a chance to review your profile. If you have questions, please contact me and I'll get back to you shortly.", ":)")
    end
    end
  end
end
