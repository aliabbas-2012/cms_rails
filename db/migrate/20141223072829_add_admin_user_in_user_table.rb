class AddAdminUserInUserTable < ActiveRecord::Migration
  def up
     user = User.new(:first_name=>'Ali',:last_name=>'Abbas',:email=>'itsgeniusstar@gmail.com',
             :gender=>'Male',:password_digest=>BCrypt::Password.create('admin'),:username=>'ali.abbas')
     user.save()
  end

  def down
    User.delete_all(:username => 'ali.abbas')
  end
end
