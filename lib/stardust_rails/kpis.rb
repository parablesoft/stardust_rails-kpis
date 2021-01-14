require "stardust_rails/kpis/engine" 
require "stardust_rails/kpis/version"
require_relative "kpis/configuration"
require_relative "kpis/dsl"
require_relative "kpis/design"
require_relative "kpis/kpi_assigned_mixin"


module StardustRails
  module Kpis

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configure
      yield(configuration)
    end
  end
end
