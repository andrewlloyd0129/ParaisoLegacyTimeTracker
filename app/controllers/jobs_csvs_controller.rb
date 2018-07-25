class JobsCsvsController < ApplicationController

    def index
    @reports = JobsCsv.all
    end

    def show
      @report = JobsCsv.find(params[:id])
      @task_entries = TaskEntry.where(job_id: @report.job_id)
      @tasks = Task.all

      @task_entries.each do |entry|
        if entry.total_cost == nil
          entry.calculate_fields
        end
      end


      respond_to do |format|
        format.html
        format.xlsx {
          response.headers['Content-Disposition'] = "attachment; filename='#{@report.job.job_number} #{@report.job.job_name} Job Costing.xlsx' "
        }
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
