class CreateHatchKPIDashboardAssignments < ActiveRecord::Migration[5.0]
  def change

    kpi_dashboard_assignments_table = :stardust_rails_kpis_kpi_dashboard_assignments

    existing_table = :hatch_kpi_dashboard_assignments

    if table_exists?(existing_table)
      rename_table existing_table, kpi_dashboard_assignments_table
    else
      create_table kpi_dashboard_assignments_table do |t|
        t.belongs_to :user
        t.belongs_to :kpi_definition, class_name: "StardustRails::Kpis::KPI::KpiDefinition"
        t.timestamps
      end
    end
  end
end
