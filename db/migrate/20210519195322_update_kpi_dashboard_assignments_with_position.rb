class UpdateKpiDashboardAssignmentsWithPosition < ActiveRecord::Migration[5.0]
  def change
    add_column :stardust_rails_kpis_kpi_dashboard_assignments, :position, :integer
  end
end
