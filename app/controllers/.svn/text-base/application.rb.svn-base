# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_ceburb_session_id'
  

  #determine what page is on and update the tab color
  def determine_tab(current_tab)
    initialize_nav_tabs
    case current_tab
    when "resource"
      @resource_tab = "current"
    when "project_list"
      @project_tab = "current"
    when "project"
      @project_tab = "current"
    else
      @index_tab = "current"
    end
  end
  
  #private methods start here
  private
  def authorize 
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Please Login"
      redirect_to(:controller => "login", :action => "login")
    end
  end
  
  def show_navigation
    @show_navigation = true
  end
  
  #initialize tabs to be unused
  def initialize_nav_tabs
    @index_tab    = "unused"
    @project_tab  = "unused"
    @resource_tab = "unused"
  end
  
end
