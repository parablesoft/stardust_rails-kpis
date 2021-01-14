module StardustRails::Kpis::KpiAssignedMixin
  def self.included(base)
    base.class_eval do
      has_many :kpi_dashboard_assignments, 
        class_name: "StardustRails::Kpis::KpiDashboardAssignment"
    end
  end

end
