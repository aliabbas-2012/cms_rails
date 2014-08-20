class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|
      t.string "name", :limit=>"50",:null =>false
      t.text "description",:null=>true 
      t.integer "position"
      t.boolean "is_visible", :default => false  		
      t.timestamps
    end
  end

  def down 
  	drop_table :subjects
  end 	
end
