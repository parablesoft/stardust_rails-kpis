Stardust::GraphQL.define_types do
  object :stardust_rails_kpis_kpi_definition do
    field :id, :id, null: false
    field :name, :string, null: false
    field :title, :string, null: true
    field :configuration, :string, null: true
    field :report_id, :id, null: true
    field :report_filter_variable, :string, null: true
    field :additional_report_variables, :raw, null: true
    field :most_recent_result, :stardust_rails_kpis_kpi_details, null: true
    field :group_name, :string, null: true
    field :dashboard_assignments, [:stardust_rails_kpis_kpi_dashboard_assignment], null: true
  end

  object :stardust_rails_kpis_kpi_details do
    field :name, :string, null: false
    field :details, :raw, null: false
    field :created_at, :datetime, null: false
    field :value, :startdust_rails_kpis_kpi_value, null: true do
      argument :id, :string, required: false
      resolve do |obj, args, _|
        obj.value(id: args.id)
      end
    end
  end

  object :startdust_rails_kpis_kpi_value do
    field :is_complex, :boolean, null: false
    field :amount, :string, null: true
    field :type, :string, null: true
  end

  input_object :stardust_rails_kpis_kpi_definition_attributes do
    argument :configuration, :string, required: true
    argument :name, :string, required: true
    argument :title, :string, required: true
    argument :group_name, :string, required: true
  end
end
