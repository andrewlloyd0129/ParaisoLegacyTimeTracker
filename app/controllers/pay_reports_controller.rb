class PayReportsController < ApplicationController
	
	before_action :set_pay_report, only: [:show]
	# access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, admin: :all

	def index
		@pay_reports = PayReport.all
	end

	def new
		@pay_report = PayReport.new
	end

	def create
		@pay_report = PayReport.new(pay_report_params)

		if @pay_report.save

    	redirect_to pay_report_path(@pay_report)
    else
    	render :new
    end
  end


  def show
  	@users_entries = @pay_report.set_users
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="pay report.xlsx"'
      }
      format.csv do |version|
        send_data @report.job.to_csv 
    end
        
    end
    # redirect_to jobs_path
  end

  private

  def set_pay_report
  	@pay_report = PayReport.find(params[:id])
  end

  def pay_report_params
  	params.require(:pay_report).permit(:start, :end)
  end

end
