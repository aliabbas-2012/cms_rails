class DemoController < ApplicationController
  layout 'admin'
  before_action :confirmed_login ,except: [:login,:logout,:attempt_login,:create_user,:create_subjects]
  def index
  end

  def login

  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end


  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

  def create_user

    user = User.new
    user.first_name = 'ali'
    user.last_name = 'abbas'

    if params['email'].nil?
      user.email = 'itsgeniusstar@gmail.com'
    else
      user.email = params['email']
    end

    if params['username'].nil?
      user.email = 'ali.abbas'
    else
      user.email = params['username']
    end
    user.password = Digest::MD5.hexdigest('admin')
    user.save

    @errors = user.errors.full_messages
  end

  def create_subjects
    @subject = {}
    last = Subject.last

    start = last.nil? ? 1 : last.id

    (start..start+4).each do |val|
      subject = Subject.create({:name => "Maths #{val}", :description => "Maths For It #{val}", :position => val, :is_visible => 1})
      @subject[subject.id] = subject
    end
  end
end
