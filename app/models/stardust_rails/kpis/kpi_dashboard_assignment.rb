class StardustRails::Kpis::KpiDashboardAssignment < ActiveRecord::Base
  def self.table_name_prefix
    'stardust_rails_kpis_'
  end

  belongs_to :user
  belongs_to :kpi_definition, 
    class_name: "StardustRails::Kpis::KpiDefinition"


end
