class PagesController < ApplicationController
  def admin_dashboard
  	
  end

  def user_dashboard
  end

  def archive
  	@q = TimeEntry.ransack(params[:q])

  	@entries = @q.result(distinct: true)

    @entries = @entries.select { |entry| entry.user_id == current_user.id }
  	
  end
end
