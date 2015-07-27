class RenameTaxIdToStatus < ActiveRecord::Migration
  def change
    rename_column :users, :tax_id, :status
  end
end
