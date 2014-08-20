class CreateUsers < ActiveRecord::Migration
  
  def up
    create_table :users do |t|
      t.column "first_name",:string, :limit=>25
      t.string "last_name", :limit=>25
      t.string "email", :limit=>25,:default=>"",:null=>false
      
      #if we are using time [t.timestamps] then no need to do this
      # t.datetime "created_at"
      # t.datetime "updated_at"		
      
      t.timestamps
    end
  end

  def down
  	drop_table :users
  end	
end
