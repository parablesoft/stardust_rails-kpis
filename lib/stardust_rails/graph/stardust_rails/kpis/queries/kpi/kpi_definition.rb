Stardust::GraphQL.define_query :stardust_rails_kpis_kpi_definition do

  description "Gets a KPI definition"
  type :stardust_rails_kpis_kpi_definition
  null false

  argument :id,
    :id,
    loads: StardustRails::Kpis::KpiDefinition,
    as: :kpi_definition,
    required: true

  def resolve(kpi_definition:)
    kpi_definition
  end

end
