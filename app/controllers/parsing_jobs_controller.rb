class ParsingJobsController < ApplicationController
  layout 'admin' 

  def index
    @parsing_jobs = ParsingJob.all
  end 

  def new
    @parsing_jobs = ParsingJob.all
    @parsing_job = ParsingJob.new()
  end

  def create
    @parsing_job = ParsingJob.new(parsing_job_params)
    @parsing_job.status = 'Queued'
    if @parsing_job.save 
      ParserJob.perform_later(@parsing_job)
      render :new, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  private 
    def parsing_job_params
      params.require(:parsing_job).permit(:target_site, 
                                          :catalog_url,
                                          :product_selector,
                                          :title_selector,
                                          :price_selector,
                                          :image_selector,
                                          :characteristics_selector,
                                          :subcategory_id)

    end
end
