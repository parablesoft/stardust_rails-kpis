Stardust::GraphQL.define_types do

  object :stardust_rails_kpis_kpi_definition do
    field :id, :id, null: false
    field :name, :string, null: false
    field :title, :string, null: true
    field :configuration, :string, null: true
    field :report_id, :id, null: true
    field :report_filter_variable, :string, null: true
    field :additional_report_variables, :raw, null: true
    field :most_recent_result, :kpi_details, null: true
    field :group_name, :string, null: true
    field :dashboard_assignments,[:kpi_dashboard_assignment], null: true
  end


  input_object :stardust_rails_kpis_kpi_definition_attributes do
    argument :configuration, :string, required: true
    argument :name, :string, required: true
    argument :title, :string, required: true
    argument :group_name, :string, required: true
  end

end
