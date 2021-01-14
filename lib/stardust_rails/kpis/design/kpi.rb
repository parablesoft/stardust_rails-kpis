class StardustRails::Kpis::Design::Kpi

  def initialize(dsl)
    @dsl = dsl
  end

  def self.test
  end

  def report_id
    dsl.report_id
  end

  def recalculate_cron
    if dsl.recalculate_cron.is_a?(Proc)
      instance_exec(&dsl.recalculate_cron)
    elsif dsl.recalculate_cron.present?
      dsl.recalculate_cron
    end
  end

  def report_filter_variable
    dsl.report_filter_variable
  end

  def additional_report_variables
    if dsl.additional_report_variables.is_a?(Proc)
      instance_exec(&dsl.additional_report_variables)
    else
      {}
    end
  end


  def calculation
    instance_exec(&dsl.calculation)
  end

  private 

  attr_reader :dsl
end
