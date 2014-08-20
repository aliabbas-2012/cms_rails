class ChangePositionOfColumnInUsers < ActiveRecord::Migration
  def up
  	change_column("users","gender","string",{:limit=>10,:null=>false,:default=>"Male",:after=>"password"})
  end

  def down
  	change_column("users","gender","string",{:limit=>10,:null=>false,:default=>"Male",:after=>"created_at"})
  end	
end
