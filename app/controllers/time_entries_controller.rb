class TimeEntriesController < ApplicationController
  before_action :set_entry, only: [:edit, :update, :destroy, :clock_out, :clock_out_update]

  def index
    @entries = TimeEntry.all
    @current_entry = @entries.last
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
    @entries = TimeEntry.all
    
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

  private

  def set_entry
    @entry = TimeEntry.find(params[:id])
  end

  def time_entry_params
    params.require(:time_entry).permit( :start_time, 
                                        :end_time, 
                                        :user_id, 
                                        task_entries_attributes:
                                          [ :id,
                                            :start_time,
                                            :end_time,
                                            :task_id])
  end
end
 