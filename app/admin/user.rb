ActiveAdmin.register User do

  permit_params :email, :wallet, :password, :password_confirmation, :first_name, :surname, :city, :country, :bio, :business_type, :service, :de_service,  :company, :tax_id, :website, :phone

  index do
    selectable_column
    id_column
    column :email  
    column :sign_in_count
    column :last_sign_in_at
    column :current_sign_in_at
    column :created_at
    column :updated_at
    column :city
    column :business_type
    column :company
    column :country
    actions
  end

    filter :email  
    filter :first_name
    filter :surname
    filter :city
    filter :bio
    filter :wallet
    filter :city
    filter :country
    filter :business_type
    filter :service
    filter :company
    filter :tax_id
    filter :website
    filter :phone
    filter :sign_in_count
    filter :last_sign_in_at
    filter :current_sign_in_at
    filter :created_at
    filter :updated_at
    filter :reset_password_sent_at

  form do |f|
    f.inputs "User Details" do
      f.input :email  
      f.input :first_name
      f.input :surname
      f.input :city
      f.input :bio
      f.input :wallet
      f.input :business_type, collection: [
      ["#{I18n.t'lead-new.form.business-types.field-1'}"],
      ["#{I18n.t'lead-new.form.business-types.field-2'}"],
      ["#{I18n.t'lead-new.form.business-types.field-3'}"],
      ["#{I18n.t'lead-new.form.business-types.field-4'}"],
      ["#{I18n.t'lead-new.form.business-types.field-5'}"],
      ["#{I18n.t'lead-new.form.business-types.field-6'}"],
      ["#{I18n.t'lead-new.form.business-types.field-7'}"], 
      ["#{I18n.t'lead-new.form.business-types.field-8'}"],
      ["#{I18n.t'lead-new.form.business-types.field-9'}"],
      ["#{I18n.t'lead-new.form.business-types.field-10'}"]
    ]
      f.input :service
      f.input :company
      f.input :tax_id
      f.input :website
      f.input :phone
    end
    f.actions
  end

end


