Stardust::GraphQL.define_query :stardust_rails_kpis_kpi_definitions do

  description "Gets a list of kpi definitions"
  type [:stardust_rails_kpis_kpi_definition]
  null false

  argument :assigned_only, 
    :boolean,
    required: false

  def resolve(assigned_only: false)
    if assigned_only
      StardustRails::Kpis::KpiDefinition.where(
        id: context[:current_user].kpi_dashboard_assignments.map(&:kpi_definition_id)
      )
    else
      StardustRails::Kpis::KpiDefinition.all
    end
  end

  private

  def self.authorized?(_, ctx)
    current_user = ctx[:current_user]
    current_user.present? && permitted_roles.include?(current_user.role)
  end

  #need to tighten this down
  def self.permitted_roles
    StardustRails::Kpis.configuration.viewer_roles
  end

end
