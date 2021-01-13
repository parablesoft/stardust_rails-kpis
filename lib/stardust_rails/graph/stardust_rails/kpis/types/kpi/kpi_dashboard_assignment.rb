Stardust::GraphQL.define_types do

  object :stardust_rails_kpis_kpi_dashboard_assignment do
    field :id, :id, null: false
    field :user, :user, null: false
    field :kpi_definition, :kpi_definition, null: false
  end



  input_object :stardust_rails_kpis_kpi_dashboard_assignment_attributes do
    argument :user, :user, required: false
    argument :kpi_definition, :kpi_definition, required: true
  end

end
