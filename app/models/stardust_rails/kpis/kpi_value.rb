class StardustRails::Kpis::KpiValue
  def initialize(id: nil, details:)
    @id = id
    @details = details
  end


  def is_complex
    details["value"].is_a?(Array)
  end

  def amount
    fetch_value&.fetch("value")
  end

  def type
    fetch_value&.fetch("value_type")
  end

  private

  attr_reader :id, :details

  def fetch_value
    if is_complex
      details["value"].find do |v|
        id.present? ? v["id"] == id : v["default"]
      end
    else
      details
    end
  end
end
