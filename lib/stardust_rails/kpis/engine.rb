module StardustRails
  module Kpis
    class Engine < ::Rails::Engine
      isolate_namespace StardustRails::Kpis

      config.autoload_paths += %W( #{config.root}/app/models )

      initializer :append_migrations do |app|
        root_path = app.root.to_s

        if root_path !~ /#{root}/ || root_path == "#{root}/test/dummy"
          config.paths['db/migrate'].expanded.each do |migration_path|
            app.config.paths['db/migrate'] << migration_path
          end
        end
      end

      initializer :scheduler do |app|

        StardustRails::Kpis::KpiDefinition.all.each do |kpi_definition|
          kpi_definition.set_recalculation_schedule!
        end
      end

    end
  end
end
