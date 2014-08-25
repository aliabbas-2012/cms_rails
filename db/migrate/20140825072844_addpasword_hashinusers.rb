class AddpaswordHashinusers < ActiveRecord::Migration
  def up
    remove_column "users", "password"
    add_column "users", "password_digest", :string , :after=> 'email'
    add_column "users", "username", :string , :after=> 'email' ,:limit => 40
  end

  def down
    add_column "users", "password", :string, :limit => 40
    remove_column "users", "password_digest"
    remove_column "users", "username"
  end
end
