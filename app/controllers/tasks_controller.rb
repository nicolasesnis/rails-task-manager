class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    set_task
  end

  def update
    set_task
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    set_task
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:name, :detail)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
