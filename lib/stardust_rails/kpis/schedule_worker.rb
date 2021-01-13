require 'sidekiq-scheduler'

class StardustRails::Kpis::ScheduleWorker
  include Sidekiq::Worker

  def perform(kpi)

    
  end
end
