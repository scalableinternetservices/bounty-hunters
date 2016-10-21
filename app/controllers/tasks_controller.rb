class TasksController < ApplicationController
  def new
      @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
        redirect_to @task, alert: "Task created successfully."
    else
        redirect_to new_user_path, alert: "Error creating task."
    end
  end
  
  def show
    @tasks = Task.all
  end
  
  private

  def task_params
    params.require(:task).permit(:name, :description, :price)
  end
end
