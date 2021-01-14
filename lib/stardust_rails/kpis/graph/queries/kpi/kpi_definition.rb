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
  
  private

  def self.authorized?(_, ctx)
    current_user = ctx[:current_user]
    current_user.present? && permitted_roles.include?(current_user.role)
  end

  def self.permitted_roles
    StardustRails::Kpis.configuration.manager_roles
  end


end
