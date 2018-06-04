class JobsCsvsController < ApplicationController

    def index
    @jobs = Job.order(job_number: :asc)
    end

    def show
      @job = Job.find(params[:id])
      respond_to do |format|
        format.html
        format.csv { send_data @job.to_csv }
      end
    end
end
