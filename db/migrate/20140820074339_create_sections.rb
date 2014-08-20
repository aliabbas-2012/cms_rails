class CreateSections < ActiveRecord::Migration
  
  def up
    create_table :sections do |t|
       t.belongs_to :page
       t.string "name",:null=> false, :limit=> 50
       t.string "content_type",:null=> false, :limit=> 50
       t.text "content", :null=> false  
       t.integer "position"  	
       t.boolean "is_visible",:default=> true

       t.timestamps		
       
    end
    add_foreign_key(:sections, :pages, column: 'page_id',name: 'fk_sections_page')
    add_index("sections","page_id")

  end

  def down
    remove_foreign_key(:sections, name: 'fk_sections_page')
  	remove_index("sections","page_id")
  	drop_table :sections
  end	
end
