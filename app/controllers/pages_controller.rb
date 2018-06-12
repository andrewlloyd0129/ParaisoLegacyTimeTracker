class PagesController < ApplicationController
  def admin_dashboard
  	
  end

  def user_dashboard
  end

  def archive
  	    current_user.has_roles?(:admin) ? @entries = TimeEntry.order(start_time: :desc) : @entries = TimeEntry.where(user_id: current_user.id).order(start_time: :desc)
  end
end
