class ProjectsController < ApplicationController
  
  before_action :set_project, only: [:show, :edit, :update, :destroy, :users, :add_user]
  
  def index
    @projects = Project.paginate(page: params[:page], per_page: 8)
    @project = Project.new
  end

  def new
    @project = Project.new
  end

  def show 
    @task = @project.tasks.build
    @tasks = @project.tasks.all
    
    
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.users << current_user
    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new
    end
  end

  def update
    @project.users << user
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Project was successfully desproyed."
  end

  def add
    @project = Project.find(params[:id])
    @project.users << User.find(params[:user_id])
     redirect_to @project
  end
  
  def add_user
    @project_user = UserProject.new(user_id: params[:user_id], project_id: @project.id)
    
    
      if @project_user.save
         redirect_to users_project_url(id: @project.id, user_id: @project.user_id),
          notice: "User was successfully added to project" 
      else
        redirect_to users_project_url(id: @project.id, user_id: @project.user_id),
          error: "User was not added to project" 
      end
  end
 


  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :details,  user_ids: [])
    end
end