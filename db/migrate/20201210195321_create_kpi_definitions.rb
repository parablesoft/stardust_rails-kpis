class CreateKpiDefinitions < ActiveRecord::Migration[5.0]
  def change
    kpi_definitions_table_name = :stardust_rails_kpis_kpi_definitions

    if table_exists?(:hatch_kpi_kpi_definitions) 
      remove_column :hatch_kpi_kpi_definitions, :report_id
      rename_table :hatch_kpi_kpi_definitions, kpi_definitions_table_name
    else
      create_table kpi_definitions_table_name do |t|
        t.text :configuration
        t.string :name
        t.string :title
        t.string :group_name
        t.timestamps
      end

    end
  end
end
