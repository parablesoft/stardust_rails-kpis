Stardust::GraphQL.define_mutation :stardust_rails_kpis_kpi_definitions_calculate do

  description "Updates a product"

  argument :id,
    :id, 
    required: true,
    loads: StardustRails::Kpis::KpiDefinition, 
    as: :kpi_definition

  field :kpi_definition, 
    :stardust_rails_kpis_kpi_definition,
    null: true

  null false


  def resolve(
    kpi_definition:
  )
    kpi_definition.calculate!

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
