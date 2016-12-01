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
    #split the comma-separated input
    @task.tags = params[:task][:tags].split(',')
    
    if @task.save
        redirect_to @task, alert: "Task created successfully."
    else
        redirect_to new_task_path, alert: "Error creating task."
    end
  end
  
  
  def index
    if params[:search]
      @tasks = Task.search(params[:search], params[:page])
    else
      @tasks = Task.paginate(:page => params[:page], :per_page => 5)
    end
  end

  def show
    @task = Task.find_by_id(params[:id])
    if @task.nil?
      redirect_to action: :index
    end
  end
  

  def confirm
    @task = Task.find_by_id(params[:id])
    if current_user.posts.include? @task
      if @task.completer_id
        user = User.find_by_id(@task.completer_id)
        price = @task.price + user.amount
        if @task.destroy
          user.update_attribute(:amount, price)
          redirect_to pending_task_path, alert: "Owner confirmed, and completer succesfully earned bounty. Task successfully destroyed."
        else
          redirect_to main_app_path, alert: "Error destroying task."
        end
      else
        redirect_to pending_task_path, alert: "Task is not completed by the claimer yet."
      end
    end
  end
  
  
  def destroy
    @task = Task.find_by_id(params[:id])
    if current_user.posts.include? @task
      if @task.destroy
        redirect_to main_app_path, alert: "Task successfully destroyed."
      else
        redirect_to main_app_path, alert: "Error destroying task."
      end
    else
      redirect_to main_app_path, alert: "Could not destroy task."
    end
  end
  
  def claim
    @task = Task.find_by_id(params[:id])
    unless @task.claimer_id?
      current_user.claims << @task
      if @task.save
        redirect_to main_app_path, alert: "Successfully claimed task!"
      else
        redirect_to main_app_path, alert: "Error saving claim."
      end
    else
      redirect_to main_app_path, alert: "Error: task already claimed!"
    end
  end
  
  def complete
    @task = Task.find_by_id(params[:id])
    if current_user.claims.include? @task
      current_user.completes << @task
      if @task.save
        redirect_to pending_task_path, alert: "Successfully completed task! Waiting owner to confirm"
      else
        redirect_to main_app_path, alert: "Error saving claim."
      end
      # price = @task.price + current_user.amount
      # if @task.destroy
      #   current_user.update_attribute(:amount, price)
      #   redirect_to main_app_path, alert: "Task successfully completed."
      # else
      #   redirect_to @task, alert: "Error completing task."
      # end
    end
  end
  
  def cancel
    Task.update(params[:id], :claimer_id=>nil)
    redirect_to main_app_path, alert: "Successfully canceled task!"
  end
  
  private

  def task_params
    params.require(:task).permit(:name, :address, :description, :price, :tags, :owner_id, :claimer_id)
  end
end
