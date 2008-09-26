class AdminController < ApplicationController
  before_filter :authorize
  before_filter :show_navigation
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @project_pages, @projects = paginate :projects, :per_page => 10
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = 'Project was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = 'Project was successfully updated.'
      redirect_to :action => 'show', :id => @project
    else
      render :action => 'edit'
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
  def new_article
    @article = Article.new
  end
  
  def create_article
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = "New Article made"
      redirect_to(:action => 'new_article')
    else
      render :action => 'new_article'
    end
  end
  
  def list_articles
    @article_pages, @articles = paginate :articles, :per_page => 10
  end
  
  def show_article
    @article = Article.find(params[:id])
  end
  
  def edit_article
    @article = Article.find(params[:id])
  end
  
  def update_article
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "Article Successfully Updated"
      redirect_to :action => 'show_article', :id => @article
    else
      redirect_to :action => 'list_articles'
    end
  end
  
  def delete_article
    Article.find(params[:id]).destroy
    redirect_to :action => 'list_articles'
  end
  
end
