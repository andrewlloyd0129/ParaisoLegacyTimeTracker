class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_status]
  access admin: :all

  def index
   @tasks = Task.order(title: :asc)
   @users = User.all
  end
  
  def test
    
  end


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
      if @task.save
        redirect_to tasks_path
      else
        render :new
      end
  end

  def edit
  end
  
  def update
      if @task.update(task_params)
        @task.save
        redirect_to tasks_path, notice: 'Your task was edited successfully'
      else
        render :edit, notice: "Error updating your task"
      end
  end

  def show
    @task = Task.find(params[:id])
  end
  
  def destroy
    if @task.destroy
          redirect_to tasks_path, notice: 'Your task was destroyed successfully'
      else
        render :show, notice: 'Your task could not be destroyed'
      end
  end



  def toggle_status
    if @task.active?
      @task.inactive!
    elsif @task.inactive?
      @task.active!
    end      
    redirect_to tasks_path, notice:  "#{@task.title} status has been updated."
  end


  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :status)
    end

end
