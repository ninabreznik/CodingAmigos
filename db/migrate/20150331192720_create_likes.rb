class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :likee_id #project or whatever user likes
      t.integer :likeable_id #user 
      t.string :likeable_type
      t.timestamps null: false
    end
 
    add_index :likes, :likeable_id
  end
end
