class TimeEntriesController < ApplicationController
  before_action :set_entry, only: [:edit, :update, :destroy, :clock_out, :clock_out_update, :switch_task, :switch_task_update, :admin_approve, :admin_reject]

  def index
    current_user.has_roles?(:admin) ? @entries = TimeEntry.order(start_time: :desc) : @entries = TimeEntry.where(user_id: current_user.id).order(start_time: :desc)
    @current_entry = TimeEntry.where(user_id: current_user.id, end_time: nil).last
    @pending = TimeEntry.where(status: 'pending')
    @todays_entries = TimeEntry.todays_entries @entries
    @weeks_entries = TimeEntry.this_weeks_entries @entries

  end

  def new
    @entry = TimeEntry.new
  end

  def create
    @entry = TimeEntry.new(time_entry_params)
    @entry.user_id = current_user.id
    if @entry.save
      redirect_to time_entries_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @entry.update(time_entry_params)
      @entry.save
      @entry.pending!
      redirect_to time_entries_path, notice: 'Your time entry edit was submitted for approval'
    else
      render :edit, notice: 'Error submitting your request'
    end
  end

  def destroy
    if @entry.destroy
      redirect_to time_entries_path, notice: 'Your time entry has been deleted'
    else
      render :index, notice: 'Your time entry could not be deleted'
    end
  end

  def clock_out
    @current_entry = TimeEntry.where(user_id: current_user.id).last
  end

  def clock_out_update
    if @entry.update(time_entry_params)
      @entry.save
      @entry.approved!
      redirect_to time_entries_path, notice: 'Clocked Out'
    else
      render :edit, notice: 'Error submitting your request'
    end
  end

  def switch_task
  end

  def switch_task_update
    if @entry.update(time_entry_params)
      @entry.save
      redirect_to time_entries_path, notice: 'Task Switched'
    else
      render :edit, notice: 'Error submitting your request'
    end
  end

  def admin_approve
    @entry.approved!
    redirect_to :root
  end

  def admin_reject
    redirect_to :root
  end

  private

  def set_entry
    @entry = TimeEntry.find(params[:id])
  end

  def time_entry_params
    params.require(:time_entry).permit( 
      :start_time, 
      :end_time, 
      :user_id, 
      :task_entry,
      task_entries_attributes:
      [ :id,
        :start_time,
        :end_time,
        :task_id,
        :job_id,
        :_destroy])
  end
end
