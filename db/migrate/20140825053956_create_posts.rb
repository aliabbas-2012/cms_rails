class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|

      t.string "name", :null=> false, :limit=> 50
      t.text "body", :null=> false
      t.integer "position"
      t.string "permalink", :null=> false,:limit=> 50
      t.boolean "is_visible", :default=> true
      t.timestamps
    end


    add_index("posts","permalink")


  end

  def down

    remove_index("posts","permalink")

    drop_table :posts


  end
end
