class PagesController < ApplicationController
  def admin_dashboard
  	
  end

  def user_dashboard
  end

  def archive
  	current_user.has_roles?(:admin) ? @q = TimeEntry.ransack(params[:q]) : @q = TimeEntry.where(user_id: current_user.id).order(start_time: :desc).ransack(params[:q])

  	@entries = @q.result(distinct: true)
  	
  end
end
