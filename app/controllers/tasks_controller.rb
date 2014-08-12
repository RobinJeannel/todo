class TasksController < ApplicationController

  def index
    @tasks = Task.order(priority: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new #get
  @task = Task.new
  end

  def create #post
    Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])

  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task was destroyed"
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :priority)
  end

end
