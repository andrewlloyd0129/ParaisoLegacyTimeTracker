class JobsCsvsController < ApplicationController

    def index
    @reports = JobsCsv.all
    end

    def show
      @report = JobsCsv.find(params[:id])
      @task_entries = TaskEntry.where(job_id: @report.job_id)
      respond_to do |format|
        format.html
        format.csv do |version|
          send_data @report.job.to_csv 
      end
          
      end
      # redirect_to jobs_path
    end

    def download
      redirect_to jobs_csvs_path(@report, format: :csv)
    end

    def new
      @report = JobsCsv.new
      @payroll_burden = JobsCsv.last
    end

    def create
      @report = JobsCsv.new(report_params)
      if @report.save
         @report.populate_fields
        redirect_to jobs_csvs_path
      else
        render :new
      end
  
    end

    private

    def report_params
      params.require(:jobs_csv).permit(:csv, :payrollburden,:job_id)
    end
end
