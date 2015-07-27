ActiveAdmin.register Lead do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :business_type, :zip, :location, :description, :time, :name, :email, :phone, :title
  #
  index do
    selectable_column
    id_column
      column :business_type  
      column :zip
      column :location
      column :title
      column :description
      column :time
      column :name
      column :email
      column :phone
    actions
  end

  filter :business_type  
  filter :zip
  filter :location
  filter :description
  filter :time
  filter :title
  filter :name
  filter :email
  filter :phone
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "Lead Details" do
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
      f.input :zip
      f.input :location, collection: [
      ["#{I18n.t'lead-new.form.country-1'}", "#{I18n.t'lead-new.form.country-1'}"], 
      ["#{I18n.t'lead-new.form.country-2'}", "#{I18n.t'lead-new.form.country-2'}"], 
      ["#{I18n.t'lead-new.form.country-3'}", "#{I18n.t'lead-new.form.country-3'}"], 
      ["#{I18n.t'lead-new.form.country-4'}", "#{I18n.t'lead-new.form.country-4'}"], 
      ["#{I18n.t'lead-new.form.country-5'}", "#{I18n.t'lead-new.form.country-5'}"], 
      ["#{I18n.t'lead-new.form.country-6'}", "#{I18n.t'lead-new.form.country-6'}"], 
      ["#{I18n.t'lead-new.form.country-7'}", "#{I18n.t'lead-new.form.country-7'}"], 
      ["#{I18n.t'lead-new.form.country-8'}", "#{I18n.t'lead-new.form.country-8'}"], 
      ["#{I18n.t'lead-new.form.country-9'}", "#{I18n.t'lead-new.form.country-9'}"], 
      ["#{I18n.t'lead-new.form.country-10'}", "#{I18n.t'lead-new.form.country-10'}"], 
      ["#{I18n.t'lead-new.form.country-11'}", "#{I18n.t'lead-new.form.country-11'}"], 
      ["#{I18n.t'lead-new.form.country-12'}", "#{I18n.t'lead-new.form.country-12'}"], 
      ["#{I18n.t'lead-new.form.country-13'}", "#{I18n.t'lead-new.form.country-13'}"], 
      ["#{I18n.t'lead-new.form.country-14'}", "#{I18n.t'lead-new.form.country-14'}"], 
      ["#{I18n.t'lead-new.form.country-15'}", "#{I18n.t'lead-new.form.country-15'}"], 
      ["#{I18n.t'lead-new.form.country-16'}", "#{I18n.t'lead-new.form.country-16'}"], 
      ["#{I18n.t'lead-new.form.country-17'}", "#{I18n.t'lead-new.form.country-17'}"], 
      ["#{I18n.t'lead-new.form.country-18'}", "#{I18n.t'lead-new.form.country-18'}"], 
      ["#{I18n.t'lead-new.form.country-19'}", "#{I18n.t'lead-new.form.country-19'}"], 
      ["#{I18n.t'lead-new.form.country-20'}", "#{I18n.t'lead-new.form.country-20'}"], 
      ["#{I18n.t'lead-new.form.country-21'}", "#{I18n.t'lead-new.form.country-21'}"], 
      ["#{I18n.t'lead-new.form.country-22'}", "#{I18n.t'lead-new.form.country-22'}"], 
      ["#{I18n.t'lead-new.form.country-23'}", "#{I18n.t'lead-new.form.country-23'}"], 
      ["#{I18n.t'lead-new.form.country-24'}", "#{I18n.t'lead-new.form.country-24'}"], 
      ["#{I18n.t'lead-new.form.country-25'}", "#{I18n.t'lead-new.form.country-25'}"], 
      ["#{I18n.t'lead-new.form.country-26'}", "#{I18n.t'lead-new.form.country-26'}"], 
      ["#{I18n.t'lead-new.form.country-27'}", "#{I18n.t'lead-new.form.country-27'}"], 
      ["#{I18n.t'lead-new.form.country-28'}", "#{I18n.t'lead-new.form.country-28'}"], 
      ["#{I18n.t'lead-new.form.country-29'}", "#{I18n.t'lead-new.form.country-29'}"] 
    ]
      f.input :description
      f.input :time
      f.input :title
      f.input :name
      f.input :email
      f.input :phone
    end
    f.actions
  end







end
