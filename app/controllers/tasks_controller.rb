class TasksController < ApplicationController
  def new
    if user_signed_in?
      @task = Task.new
    else
      redirect_to new_user_session_path, notice: 'Log in to create a new task.'
    end
  end
  
  def create

    #link up the user and the tasks
    @task = current_user.posts.create(task_params)
    if @task.save
        redirect_to @task, alert: "Task created successfully."
    else
        redirect_to new_user_path, alert: "Error creating task."
    end
  end
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by_id(params[:id])
    if @task.nil?
      redirect_to action: :index
    end
  end
  
  def destroy
    @task = Task.find_by_id(params[:id])
    if current_user.posts.include? @task
      if @task.destroy
        redirect_to main_app_path, alert: "Task successfully destroyed."
      else
        redirect_to @task, alert: "Error destroying task."
      end
    else
      redirect_to @task, alert: "Could not destroy task."
    end
  end
  
  def claim
    @task = Task.find_by_id(params[:id])
    unless @task.claimer_id?
      current_user.claims << @task
      if @task.save
        redirect_to :back, alert: "Successfully claimed task!"
      else
        redirect_to main_app, alert: "Error saving claim."
      end
    else
      redirect_to main_app, alert: "Error: task already claimed!"
    end
  end
  
  def complete
    @task = Task.find_by_id(params[:id])
    if current_user.claims.include? @task
      if @task.destroy
        redirect_to main_app_path, alert: "Task successfully completed."
      else
        redirect_to @task, alert: "Error completing task."
      end
    end
  end
  
  def cancel
    Task.update(params[:id], :claimer_id=>nil)
    redirect_to :back, alert: "Successfully canceled task!"
  end
  
  private

  def task_params
    params.require(:task).permit(:name, :location, :description, :price, :owner_id, :claimer_id)
  end
end
