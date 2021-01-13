class StardustRails::Kpis::Dsl::Kpi

  def report_id(value=nil)
    if value.present?
      @report_id = value
    else
      @report_id
    end
  end

  def report_filter_variable(value=nil)
    if value.present?
      @report_filter_variable = value
    else
      @report_filter_variable
    end
  end

  def additional_report_variables(&block)
    if block_given?
      @additional_report_variables = block
    else
      @additional_report_variables
    end
  end

  def calculation(&block)
    if block_given?
      @calculation = block
    else
      @calculation
    end
  end
end
