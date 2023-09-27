lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stardust_rails/kpis/version"

Gem::Specification.new do |spec|
  spec.name = "stardust_rails-kpis"
  spec.version = StardustRails::Kpis::VERSION
  spec.authors = ["Vic Amuso"]
  spec.email = ["vic@parablesoft.com"]

  spec.summary = %q{KPIs engine for rails applications}
  spec.description = %q{Stardust KPIs module}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.0.2"
  spec.add_dependency "sidekiq", ">= 6.0.0"
  spec.add_dependency "pg"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "byebug"
end
