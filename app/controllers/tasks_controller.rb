class TasksController < ApplicationController
 
  

  # GET projects/1/tasks
  def index
    @tasks = @project.tasks
  end

  # GET projects/1/tasks/1
  def show
  end

  # GET projects/1/tasks/new
  def new
    @task = @project.tasks.build
  end

  # GET projects/1/tasks/1/edit
  def edit
  end

  # POST projects/1/tasks
  def create
    @project =Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to project_path(@project)
    else
      render action: 'new'
    end
  end

  # PUT projects/1/tasks/1
  def update
    if @task.update_attributes(task_params)
      redirect_to(@task.project, notice: 'Task was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/tasks/1
  def destroy
    @task.destroy

    redirect_to @project
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    

  

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:title, :project_id)
    end
end
