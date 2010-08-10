require 'rubygems'

begin
  require './lib/data_fabric/version'
  require 'jeweler'
  Jeweler::Tasks.new do |p|
    p.version = DataFabric::Version::STRING
    p.authors = ["Mike Perham"]
    p.email  = 'mperham@gmail.com'
    p.summary = 'Sharding and replication support for ActiveRecord 2.x'
    p.homepage = "http://github.com/mperham/data_fabric"
    p.name = "data_fabric"
    p.files =  FileList['*.rdoc', 'Rakefile', 'init.rb', 'CHANGELOG', "{lib,test,rails,example,example23}/**/*", ]
    p.add_development_dependency 'jeweler'
    p.add_development_dependency 'flexmock'
  end
rescue LoadError => le
  puts "Jeweler, or one of its dependencies, is not available. Install it with: gem install jeweler: #{le.message}"
end

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.verbose = true
  t.libs << 'test' << 'rails'
  t.test_files = FileList['test/*_test.rb']
end

task :gemspec => [:clean]

task :clean do
  FileUtils.rm_f Dir['*.gem']
  FileUtils.rm_f Dir['test/*.db']
  FileUtils.rm_rf 'coverage'
end

desc "Install gem locally"
task :installer do
  sh "gem install data_fabric-*.gem"
end

task :gem do
  sh "gem build data_fabric.gemspec"
end

desc "Push gem to RubyForge"
task :publish => [:clean, :gemspec, :gem, :installer] do
  require 'lib/data_fabric/version'
  sh "gem push data_fabric-#{DataFabric::Version::STRING}.gem"
end


task :default => :test
task :test => [:pretest]

desc "Test all versions of ActiveRecord installed locally"
task :test_all do
  Gem.source_index.search(Gem::Dependency.new('activerecord', '>=2.0')).each do |spec|
    puts `rake test AR_VERSION=#{spec.version}`
  end
end

task :pretest do
  setup(false)
end

task :create_db do
  setup(true)
end

def load_database_yml
  filename = "test/database.yml"
  if !File.exist?(filename)
    STDERR.puts "\n*** ERROR ***:\n" <<
      "You must have a 'test/database.yml' file in order to create the test database. " <<
      "An example is provided in 'test/database.yml.mysql'.\n\n"
    exit 1
  end
  YAML::load(ERB.new(IO.read(filename)).result)
end

def setup_connection
  require 'active_record'
  ActiveRecord::Base.configurations = load_database_yml
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger.level = Logger::INFO
end

def using_connection(database_identifier, &block)
  ActiveRecord::Base.establish_connection(database_identifier)
  ActiveRecord::Base.connection.instance_eval(&block)
end

def setup(create = false)
  setup_connection
  
  ActiveRecord::Base.configurations.each_pair do |identifier, config|
    using_connection(identifier) do
      send("create_#{config['adapter']}", create, config['database'])
    end  
  end
end

def create_sqlite3(create, db_name)
  execute "drop table if exists the_whole_burritos"
  execute "drop table if exists enchiladas"
  execute "create table enchiladas (id integer not null primary key, name varchar(30) not null)"
  execute "insert into enchiladas (id, name) values (1, '#{db_name}')"
  execute "create table the_whole_burritos (id integer not null primary key, name varchar(30) not null)"
  execute "insert into the_whole_burritos (id, name) values (1, '#{db_name}')"
end

def create_mysql(create, db_name)
  if create
    execute "drop database if exists #{db_name}"
    execute "create database #{db_name}"
  end
  execute "use #{db_name}"
  execute "drop table if exists the_whole_burritos"
  execute "drop table if exists enchiladas"
  execute "create table enchiladas (id integer not null auto_increment, name varchar(30) not null, primary key(id))"
  execute "insert into enchiladas (id, name) values (1, '#{db_name}')"
  execute "create table the_whole_burritos (id integer not null auto_increment, name varchar(30) not null, primary key(id))"
  execute "insert into the_whole_burritos (id, name) values (1, '#{db_name}')"
end

# Test coverage
begin
  gem 'rcov' rescue nil
  require 'rcov/rcovtask'

  desc "Generate coverage numbers for all locally installed versions of ActiveRecord"
  task :cover_all do
    Gem.source_index.search(Gem::Dependency.new('activerecord', '>=2.0')).each do |spec|
      puts `rake cover AR_VERSION=#{spec.version}`
    end
  end

  task :cover => [:pretest, :rcov_impl]

  Rcov::RcovTask.new('rcov_impl') do |t|
    t.libs << "test"
    t.test_files = FileList["test/*_test.rb"]
    t.output_dir = "coverage/#{ENV['AR_VERSION']}"
    t.verbose = true
    t.rcov_opts = ['--text-report', '--exclude', "test,Library,#{ENV['GEM_HOME']}", '--sort', 'coverage']
  end
rescue LoadError => e
  puts 'Test coverage support requires \'gem install rcov\''
end
