class JobsCsvsController < ApplicationController

    def index
    @jobs = Job.order(job_number: :asc)
    end

    def show
      @job = Job.find(params[:id])
      @task_entries = TaskEntry.where(job_id: @job.id)
      respond_to do |format|
        format.html
        format.csv { send_data @job.to_csv }
      end
    end

    def new
      @report = JobsCsv.new
      @payroll_burden = JobsCsv.last
    end

    def create
      @report = JobsCsv.new(report_params)
      if @report.save
        redirect_to jobs_path
      else
        render :new
      end
  
    end

    private

      def report_params
      params.require(:jobs_csv).permit(:csv, :payrollburden)
    end
end
