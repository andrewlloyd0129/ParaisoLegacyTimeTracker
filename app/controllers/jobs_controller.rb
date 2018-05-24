class JobsController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy, :toggle_status]
  # access all: [:show, :index], user: {except: [:destroy, :new ,:create, :update, :edit, :sort]}, admin: :all

  def index
   @jobs = Job.all
  end


  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
      if @job.save
        redirect_to job_path(@job)
      else
        render :new
      end
  end

  def edit
  end
  
  def update
      if @job.update(job_params)
        @job.save
        redirect_to @job, notice: 'Your job was edited successfully'
      else
        render :edit, notice: "Error updating your job"
      end
  end

  def show
    @job = Job.find(params[:id])
  end
  
  def destroy
    if @job.destroy
          redirect_to jobs_path, notice: 'Your job was destroyed successfully'
      else
        render :show, notice: 'Your job could not be destroyed'
      end
  end



  def toggle_status
    if @job.active?
      @job.inactive!
    elsif @job.inactive?
      @job.active!
    end      
    redirect_to job_path, notice:  "#{@job.job_name} status has been updated."
  end


  private

    def set_portfolio
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:job_number, :job_name)
    end

end
