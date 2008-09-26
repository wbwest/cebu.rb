class CeburbController < ApplicationController
  #initialize navigation tabs
  before_filter :initialize_nav_tabs
  
  def index
    @articles = Article.find(:all, :limit => "3", :order => "id desc")
    #instantiate the tabs used
    #determine_tab("index")
  end
  
  def project_list
    #instantiate the tabs used
    #determine_tab("project")
    @project_pages, @projects = paginate :projects, :per_page => 10, :order => "id desc"
  end
  
  def project
    #instantiate tabs used
    determine_tab("project")
    begin
     @project  = Project.find(params[:id]) 
     @comments = @project.comments
    # @comment_pages = paginate :project.comments, :per_page => 3
   rescue ActiveRecord::RecordNotFound
     logger.error("Invalid access of ID through url")
     redirect_to :action => 'project_list'
   end
  end
  
  def resources
     determine_tab("resource")
  end
  
  #this part is no longer used since it was decided that comment features will no longer be made available
  def add_comment
    @comment = Comment.new(params[:comment])
    @project = Project.find(params[:id])
    @comment.project = @project
    @comment.save
    redirect_to :action => 'project', :id => @project
  end
  
  def blog
    @article_pages, @articles = paginate :articles, :per_page => 10, :order => "id desc" 
  end

end
