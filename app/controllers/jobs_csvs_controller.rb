class JobsCsvsController < ApplicationController

    def index
    @jobs = Job.order(job_number: :asc)
    end

    def show
      @task_entries = TaskEntry.where(job_id: JobsCsv.last.job_id)
      respond_to do |format|
        format.html
        format.csv do |version|
        send_data Job.last.to_csv 
      end
          
      end
      # redirect_to jobs_path
    end

    def new
      @report = JobsCsv.new
      @payroll_burden = JobsCsv.last
    end

    def create
      @report = JobsCsv.new(report_params)
      if @report.save
        redirect_to jobs_csv_path(@report, format: :csv)
      else
        render :new
      end
  
    end

    private

      def report_params
      params.require(:jobs_csv).permit(:csv, :payrollburden,:job_id)
    end
end
