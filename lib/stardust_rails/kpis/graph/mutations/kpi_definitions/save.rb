Stardust::GraphQL.define_mutation :stardust_rails_kpis_kpi_definitions_save do

  description "Updates a kpi definition"

  argument :id,
    :id, 
    required: false,
    loads: StardustRails::Kpis::KpiDefinition, 
    as: :kpi_definition

  argument :attributes,
    :stardust_rails_kpis_kpi_definition_attributes,
    required: true

  field :kpi_definition, 
    :stardust_rails_kpis_kpi_definition,
    null: true

  null false


  def resolve(
    kpi_definition: nil,
    attributes:
  )
    if kpi_definition
      kpi_definition.update!(attributes.to_h)
      if kpi_definition.previous_changes.has_key?("name")
        kpi_definition.process_rename!
      end
    else
      kpi_definition = StardustRails::Kpis::KpiDefinition.create(attributes.to_h)
      kpi_definition.calculate!
    end

    {
      kpi_definition: kpi_definition
    }
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
