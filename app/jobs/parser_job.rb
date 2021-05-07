class ParserJob < ApplicationJob
  queue_as :default

  after_perform :after_parsing

  def perform(object)
    @current_job = ParsingJob.find(object.id)
    @current_job.status = 'Parsing'
    @current_job.save
    Parser.parse(object)
    @current_job.status = 'Parsed'
    @current_job.save
  end

  def after_parsing
    @current_job.status = 'Inserting'
    @current_job.save
    Parser.insert_results(@current_job.id)
    @current_job.status = 'Finished'
    @current_job.save
  end

end
