class LoginController < ApplicationController
  #before anything else use authorize function found in application.rb except login function
  before_filter :authorize, :except => :login
  before_filter :show_navigation, :except => :login

  #declare that this controller will still use the "admin" layout
  layout "admin"
  
  def add_user
    @user = User.new(params[:user])
    if request.post? and @user.save
      flash[:notice] = "User #{@user.username} created"
      @user = User.new
    end
  end

  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:username],params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:action => 'index')
      else 
        flash[:notice] = "Invalid Account"
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to(:action => 'login')
  end

  def index  
  end
  
  def delete_user
    if request.post?
      user = User.find(params[:id])
      begin
        user.destroy
        flash[:notice] = "User #{user.username} Deleted"
      rescue Exception => e
        flash[:notice] = e.message
      end
    end
    redirect_to(:action => "list_users")
  end
  
  def list_users
    @all_users = User.find(:all)
  end
  
end
