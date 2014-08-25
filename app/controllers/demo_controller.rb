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

  def createSubjects
    @subject = {}
    last = Subject.last

    start = last.nil?? 1:last.id

    (start..start+4).each do |val|
      subject = Subject.create({:name=>"Maths #{val}",:description=>"Maths For It #{val}",:position=>val,:is_visible=>1})
      @subject[subject.id] = subject
    end
  end
end
