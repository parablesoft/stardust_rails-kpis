require 'method_source'
module StardustRails
  module Kpis
      class Dsl

        def initialize
          self
        end

        def kpi(&block)
          if block_given?
            @kpi = StardustRails::Kpis::Dsl::Kpi.new
            @kpi.instance_eval(&block)
            @kpi
          else
            @kpi
          end
        end

      end
  end
end
