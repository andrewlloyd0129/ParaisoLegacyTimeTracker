class TaskEntriesController < ApplicationController
	before_action :set_task_entry, only: [:show, :edit, :update, :destroy, :toggle_status]
	# access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, admin: :all

	def index
		@task_entries = TaskEntry.all.order(start_time: :desc)
	end

	def new
    @task_entry = TaskEntry.new
	end

	def create
    @task_entry = TaskEntry.new(task_entry_params)
    
		if @task_entry.save


      	# TODO REDIRECT TO NOT A SHOW PAGE FOR TASK ENTRY
        @task_entry.get_task_between(3, 4)

      	redirect_to task_entry_path(@task_entry)
      else
      	render :new
      end
  end

  def edit
  end
  
  def update
    @task = Task.all
  	if @task_entry.update(task_entry_params)
  		@task_entry.save
      @task_entry.get_task_between(3, 4)


      	# TODO REDIRECT TO NOT A SHOW PAGE FOR TASK ENTRY

      	redirect_to @task_entry, notice: 'Your task entry was edited successfully'
      else
      	render :edit
      end
  end

  def show
  	@task_entry = TaskEntry.find(params[:id])
  end
  
  def destroy
  	if @task_entry.destroy
  		redirect_to task_entries_path, notice: 'Your task_entry was destroyed successfully'
  	else
  		render :show, notice: 'Your task_entry could not be destroyed'
  	end
  end


  # DO WE NEED A TOGGLE STATUS? PROBABLY? TODO FIGURE OUT SPECIFICS ON TOGGLE STATUS LATER

  def toggle_status
  	if @task_entry.draft?
  		@task_entry.published!
  	elsif @task_entry.published?
  		@task_entry.draft!
  	end      
  	redirect_to task_entry_path, notice:  "#{@task_entry.title} status has been updated."
  end


  private

  def set_task_entry
  	@task_entry = TaskEntry.find(params[:id])
  end

  def task_entry_params
  	params.require(:task_entry).permit(:start_date, :start_time, :end_date, :end_time, :task_id, :time_entry_id, :job_id )
  end

end
