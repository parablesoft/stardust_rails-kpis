require "stardust_rails/kpis/engine" 
require "stardust_rails/kpis/version"
require_relative "kpis/configuration"
require_relative "kpis/dsl"
require_relative "kpis/design"
require_relative "kpis/kpi_assigned_mixin"
require_relative "kpis/schedule_worker"
require_relative "kpis/scheduler"


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
