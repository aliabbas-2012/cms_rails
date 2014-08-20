class AddSomeColumnsInUser < ActiveRecord::Migration
  def up
  	add_column("users","password","string",{:after=>"email",:limit=>40,:null=>false})
  	add_column("users","gender","string",{:limit=>10,:null=>false,:default=>"Male"})
  end

  def down
  	remove_column("users","password")
  	remove_column("users","gender")
  end	
end
