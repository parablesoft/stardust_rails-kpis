class StardustRails::Kpis::Kpi < ActiveRecord::Base
  def self.table_name_prefix
    "stardust_rails_kpis_"
  end

  def value(id: nil)
    StardustRails::Kpis::KpiValue.new(id: id,details: self.details)
  end
end
