# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{data_fabric}
  s.version = "1.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Perham"]
  s.date = %q{2009-03-28}
  s.email = %q{mperham@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "TESTING.rdoc", "Rakefile", "VERSION.yml", "init.rb", "CHANGELOG", "lib/data_fabric", "lib/data_fabric/ar20.rb", "lib/data_fabric/ar22.rb", "lib/data_fabric/dash.rb", "lib/data_fabric/version.rb", "lib/data_fabric.rb", "test/connection_test.rb", "test/database.yml", "test/database.yml.mysql", "test/database_test.rb", "test/shard_test.rb", "test/test_helper.rb", "test/thread_test.rb", "rails/init.rb", "example/app", "example/app/controllers", "example/app/controllers/accounts_controller.rb", "example/app/controllers/application.rb", "example/app/controllers/figments_controller.rb", "example/app/helpers", "example/app/helpers/accounts_helper.rb", "example/app/helpers/application_helper.rb", "example/app/helpers/figments_helper.rb", "example/app/models", "example/app/models/account.rb", "example/app/models/figment.rb", "example/app/views", "example/app/views/accounts", "example/app/views/accounts/index.html.erb", "example/app/views/layouts", "example/app/views/layouts/application.html.erb", "example/config", "example/config/boot.rb", "example/config/database.yml", "example/config/environment.rb", "example/config/environments", "example/config/environments/development.rb", "example/config/environments/production.rb", "example/config/environments/test.rb", "example/config/initializers", "example/config/initializers/inflections.rb", "example/config/initializers/mime_types.rb", "example/config/initializers/new_rails_defaults.rb", "example/config/routes.rb", "example/db", "example/db/migrate", "example/db/migrate/20080702154628_create_accounts.rb", "example/db/migrate/20080702154820_create_figments.rb", "example/db/schema.rb", "example/public", "example/public/404.html", "example/public/422.html", "example/public/500.html", "example/public/dispatch.cgi", "example/public/dispatch.fcgi", "example/public/dispatch.rb", "example/public/favicon.ico", "example/public/images", "example/public/images/rails.png", "example/public/robots.txt", "example/Rakefile", "example/script", "example/script/about", "example/script/console", "example/script/dbconsole", "example/script/destroy", "example/script/generate", "example/script/performance", "example/script/performance/benchmarker", "example/script/performance/profiler", "example/script/performance/request", "example/script/plugin", "example/script/process", "example/script/process/inspector", "example/script/process/reaper", "example/script/process/spawner", "example/script/runner", "example/script/server", "example/test", "example/test/fixtures", "example/test/fixtures/accounts.yml", "example/test/functional", "example/test/functional/accounts_controller_test.rb", "example/test/integration", "example/test/integration/account_figments_test.rb", "example/test/test_helper.rb", "example22/app", "example22/app/controllers", "example22/app/controllers/accounts_controller.rb", "example22/app/controllers/application.rb", "example22/app/controllers/figments_controller.rb", "example22/app/helpers", "example22/app/helpers/application_helper.rb", "example22/app/models", "example22/app/models/account.rb", "example22/app/models/figment.rb", "example22/app/views", "example22/app/views/accounts", "example22/app/views/accounts/index.html.erb", "example22/app/views/layouts", "example22/app/views/layouts/application.html.erb", "example22/config", "example22/config/boot.rb", "example22/config/database.yml", "example22/config/environment.rb", "example22/config/environments", "example22/config/environments/development.rb", "example22/config/environments/production.rb", "example22/config/environments/test.rb", "example22/config/initializers", "example22/config/initializers/inflections.rb", "example22/config/initializers/mime_types.rb", "example22/config/initializers/new_rails_defaults.rb", "example22/config/locales", "example22/config/locales/en.yml", "example22/config/routes.rb", "example22/db", "example22/db/migrate", "example22/db/migrate/20080702154628_create_accounts.rb", "example22/db/migrate/20080702154820_create_figments.rb", "example22/public", "example22/public/404.html", "example22/public/422.html", "example22/public/500.html", "example22/public/dispatch.cgi", "example22/public/dispatch.fcgi", "example22/public/dispatch.rb", "example22/public/favicon.ico", "example22/public/images", "example22/public/images/rails.png", "example22/public/index.html", "example22/public/robots.txt", "example22/Rakefile", "example22/script", "example22/script/about", "example22/script/console", "example22/script/dbconsole", "example22/script/destroy", "example22/script/generate", "example22/script/performance", "example22/script/performance/benchmarker", "example22/script/performance/profiler", "example22/script/performance/request", "example22/script/plugin", "example22/script/process", "example22/script/process/inspector", "example22/script/process/reaper", "example22/script/process/spawner", "example22/script/runner", "example22/script/server", "example22/test", "example22/test/fixtures", "example22/test/fixtures/accounts.yml", "example22/test/functional", "example22/test/functional/accounts_controller_test.rb", "example22/test/integration", "example22/test/integration/account_figments_test.rb", "example22/test/performance", "example22/test/performance/browsing_test.rb", "example22/test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/mperham/data_fabric}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{fiveruns}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Sharding and replication support for ActiveRecord 2.x}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end