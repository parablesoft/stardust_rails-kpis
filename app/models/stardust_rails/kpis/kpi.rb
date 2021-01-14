class StardustRails::Kpis::Kpi < ActiveRecord::Base
  def self.table_name_prefix
    'stardust_rails_kpis_'
  end
end
