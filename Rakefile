require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "fumoffu"
  gem.homepage = "http://github.com/bouba/fumoffu"
  gem.license = "MIT"
  gem.summary = %Q{A JRuby / Java Swing framework to easily build portable GUI application}
  gem.description = %Q{I will make the description later}
  gem.email = "alionel@gmail.com"
  gem.authors = ["Lionel Abderemane"]
  gem.files = FileList[
                        'lib/**/*.rb',
                        'lib/**/*.java',
                        'lib/**/*.jar',
                        'lib/*.rake',
                        'lib/**/*.sh',
                        'lib/**/Gemfile',
                        'lib/**/Rakefile',
                        "tasks/*.rake",
                        'bin/*', 
                        '[A-Z]*', 
                        'test/**/*'].to_a
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #gem.add_runtime_dependency 'log4r', '>= 1.1.9'
  #gem.add_runtime_dependency 'rawr', '>= 1.4.5'
  #gem.add_runtime_dependency 'bundler', '>= 1.0.10'
  
  gem.add_development_dependency 'shoulda'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/fumoffu/**/*_test.rb'
  test.verbose = true
  test.output_dir = "test/coverage/"
  test.rcov_opts = %w{-x osx\/objc,gems\/,spec\/,\(eval\) --text-report }
  
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "fumoffu #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
