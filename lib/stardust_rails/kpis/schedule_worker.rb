require 'sidekiq-scheduler'

class StardustRails::Kpis::ScheduleWorker
  include Sidekiq::Worker

  def perform(id)
    StardustRails::Kpis::KpiDefinition.find(id).calculate!
  end
end
