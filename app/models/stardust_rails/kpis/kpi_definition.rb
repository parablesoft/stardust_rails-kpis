class StardustRails::Kpis::KpiDefinition < ActiveRecord::Base

  validates_uniqueness_of :name

  def self.table_name_prefix
    'stardust_rails_kpis_'
  end

  has_many :dashboard_assignments, 
    class_name: "StardustRails::Kpis::KpiDashboardAssignment"

  def dsl
    describe(configuration)
  end

  def calculate!
    StardustRails::Kpis::Kpi.create(name: self.name, details: calculation_result)
  end

  def self.calculate!(names:)
    names.each do |name|
      find_by(name: name)&.calculate!
    end
  end

  def process_rename!
    previous_name = previous_changes["name"].first
    StardustRails::Kpis::Kpi.where(name: previous_name).update_all(name: self.name)
  end

  def report_id
    executed_dsl_instance.report_id
  end

  def report_filter_variable
    executed_dsl_instance.report_filter_variable
  end

  def additional_report_variables
    executed_dsl_instance.additional_report_variables
  end

  def calculation_result
    executed_dsl_instance.calculation
  end

  def most_recent_result
    StardustRails::Kpis::Kpi.where(name: self.name).order(created_at: :desc).first
  end

  private

  def executed_dsl_instance
    @executed_dsl_instance = StardustRails::Kpis::Design::Kpi.new(dsl)
  end

  def describe(code=nil,&block)
    dsl = StardustRails::Kpis::Dsl.new
    if block_given?
      dsl.instance_eval(&block)
    else
      file = Tempfile.new
      begin
        file.write(code)
        file.rewind
        dsl.instance_eval(code, file.path,1)
      ensure
        file.close
        file.unlink
      end
    end
  end
end
