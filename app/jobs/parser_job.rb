class ParserJob < ApplicationJob
  queue_as :default

  before_perform :set_current_job
  after_perform :after_parsing

  def perform(object)
    @current_job.status = 'Parsing'
    @current_job.save
    Services::Parser.parse(object)
    @current_job.status = 'Parsed'
    @current_job.save
  end

  def after_parsing(object)
    console.log(object)
    @current_job.status = 'Inserting'
    @current_job.save
    console.log(object.id)
    Services::Parser.insert_results(object.id)
    @current_job.status = 'Finished'
    @current_job.save
  end

  def set_current_job
    @current_job = ParsingJob.find(object.id)
  end
end
