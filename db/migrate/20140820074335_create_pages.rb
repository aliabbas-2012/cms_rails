class CreatePages < ActiveRecord::Migration
  
  def up
    create_table :pages do |t|
      t.integer "subject_id"		
      t.string "name", :null=> false, :limit=> 50
      t.text "body", :null=> false
      t.integer "position"
      t.string "permalink", :null=> false,:limit=> 50
      t.boolean "is_visible", :default=> true 	
      t.timestamps
    end

    add_index("pages","subject_id")
    add_index("pages","permalink")
  end

  def down
  	remove_index("pages","subject_id")
    remove_index("pages","permalink")

  	drop_table :pages


  end	
end
