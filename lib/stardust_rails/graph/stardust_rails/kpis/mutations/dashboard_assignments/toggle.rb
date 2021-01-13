Stardust::GraphQL.define_mutation :stardust_rails_kpis_kpi_dashboard_assignments_toggle do

  description "Creates or deletes an assignment"

  argument :user_id,
    :id, 
    required: true

  argument :kpi_definition_id,
    :id, 
    required: true,
    loads: StardustRails::Kpis::KpiDefinition, 
    as: :kpi_definition

  field :kpi_definition, 
    :stardust_rails_kpis_kpi_definition, 
    null: true

  null false


  def resolve(
    user_id:,
    kpi_definition:
  )

    args = {
      user_id: user_id,
      kpi_definition_id: kpi_definition.id
    }

    kpi_dashboard_assignment = StardustRails::Kpis::DashboardAssignment.find_by(args)

    if kpi_dashboard_assignment
      kpi_dashboard_assignment.destroy
    else
      StardustRails::Kpis::DashboardAssignment.create(args)
    end

    kpi_definition.reload

    {
      kpi_definition: kpi_definition
    }
  end

  private

  def self.authorized?(_, ctx)
    current_user = ctx[:current_user]
    current_user.present? && current_user.system_manager?
  end

end
