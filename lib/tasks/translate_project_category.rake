namespace :projects do
  desc "Translate project.category from slovene to english"
  task :translate_project_category => :environment do
    Project.all.tap{|projects| puts "Found #{projects.size} projects to work on"}.each do |project|
      if project.category == "Kuhinja"
        project.update(category: "Kitchen")

      elsif project.category == "Kopalnica"
        project.update(category: "Bathroom")

      elsif project.category == "Spalnica"
        project.update(category: "Sleeping room")

      elsif project.category == "Dnevni prostor"
        project.update(category: "Living area")

      elsif project.category == "Jedilnica"
        project.update(category: "Dining room")

      elsif project.category == "Otroški prostor"
        project.update(category: "Children area")

      elsif project.category == "Delovni prostor"
        project.update(category: "Working area")

      elsif project.category == "Prostor za shranjevanje"
        project.update(category: "Utility & Storage")

      elsif project.category == "Vhod in garderoba"
        project.update(category: "Entrance & Checkroom")

      elsif project.category == "Hodnik"
        project.update(category: "Corridor")

      elsif project.category == "Stopnišče"
        project.update(category: "Stairs")

      elsif project.category == "Klet"
        project.update(category: "Basement")

      elsif project.category == "Garaža"
        project.update(category: "Garage & Hobby")

      elsif project.category == "Hiša & fasade"
        project.update(category: "House & Fasades")

      elsif project.category == "Hiša in fasade"
        project.update(category: "House & Facades")

      elsif project.category == "Okolica"
        project.update(category: "Surroundings")

      elsif project.category == "Svetila"
        project.update(category: "Lights")

      elsif project.category == "Hobi & dekor"
        project.update(category: "Art & Decor")

      elsif project.category == "Dekor"
        project.update(category: "Art & Decor")

      elsif project.category == "House & Fasades"
        project.update(category: "House & Facades")
      end
      
    end
  end
end