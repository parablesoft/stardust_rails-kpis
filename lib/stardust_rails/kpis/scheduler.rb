class StardustRails::Kpis::Scheduler


  def initialize(kpi_definition)
    @kpi_definition = kpi_definition
  end


  def call
    if has_recalculate_cron?
      set_schedule!
    else
      remove_schedule! if on_schedule?
    end
  end
  

  private

  attr_reader :kpi_definition

  RECALCULATE_SCHEDULE_PREFIX = "stardust_rails_kpis_kpi_definition"

  def has_recalculate_cron?
    recalculate_cron.present?
  end


  def on_schedule?
    Sidekiq.get_schedule.keys.include?(recalculate_schedule_name)
  end

  def recalculate_cron
    kpi_definition.recalculate_cron
  end

  def set_schedule!
    Sidekiq.set_schedule(
      recalculate_schedule_name,
      {
        cron: recalculate_cron, 
        class: "StardustRails::Kpis::ScheduleWorker",
        args: kpi_definition.id
      }
    )
  end

  def remove_schedule!
    Sidekiq.remove_schedule(recalculate_schedule_name)
  end

  def recalculate_schedule_name
    "#{RECALCULATE_SCHEDULE_PREFIX}_#{kpi_definition.id}"
  end
end
