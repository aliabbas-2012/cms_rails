class DemoController < ApplicationController
  def index
  end

  def createUser

    user = User.new
    user.first_name = 'ali'
    user.last_name = 'abbas'
    if params['email'].nil?
      user.email = 'itsgeniusstar@gmail.com'
    else
      user.email = params['email']
    end
    user.password = Digest::MD5.hexdigest('admin')
    user.save

    @errors =  user.errors.full_messages
  end
end
