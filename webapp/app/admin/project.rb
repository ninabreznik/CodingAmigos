ActiveAdmin.register Project do

permit_params :user_id, :title, :picture_file_name, :picture_content_type, :picture_file_size, :picture_updated_at, :description, :email, :category

index do
  selectable_column
  id_column
  column :user_id  
  column :email
  column :title
  column :category
  actions
end

  filter :user_id  
  filter :email
  filter :title
  filter :category
  filter :picture_updated_at
  filter :picture_file_name
  filter :picture_content_type
  filter :picture_file_size

form do |f|
  f.inputs "Project Details" do
  f.input :user_id  
  f.input :email
  f.input :title
  f.input :category, collection: [
      ["Kuhinja"],
      ["Kopalnica"],
      ["Spalnica"],
      ["Dnevni prostor"],
      ["Jedilnica"],
      ["Otroški prostor"],
      ["Delovni prostor"],
      ["Utility & shramba"],
      ["Vhod & garderoba"],
      ["Hodnik"],
      ["Stopnišče"],
      ["Klet"],
      ["Garaža"],
      ["Hiša & fasade"],
      ["Okolica"],
      ["Svetila"],
      ["Hobi & dekor"]
    ]
  f.input :picture_updated_at
  f.input :picture_file_name
  f.input :picture_content_type
  f.input :picture_file_size
  end
  f.actions
end

end
