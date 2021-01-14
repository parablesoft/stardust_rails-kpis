class StardustRails::Kpis::Configuration

  def manager_roles=(value)
    @manager_roles = value
  end

  def manager_roles
    @manager_roles || []
  end

  def viewer_roles=(value)
    @viewer_roles = value
  end

  def viewer_roles
    @viewer_roles
  end
end
