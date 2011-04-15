module Fumoffu
  module Generators
     class Configuration
       # :call-seq:
       #    generate()
       #
       # Use this to generate the application configuration skeleton
       #
       #    Fumoffu::Generators::Configuration.generate
       #
       # Generate default configuration files for the engine component of the application
       # which by default contains 2 parts the file used for the initialization of the application
       # and also the tasks related the application engine.
       #
       def self.generate
          source_dir = File.dirname(__FILE__)
          mkdir_p "#{Fumoffu::Application.app_dir}/engine", :verbose => false
          mkdir_p "#{Fumoffu::Application.app_dir}/engine/config", :verbose => false
          
          self.generate_engine
          mkdir_p "#{Fumoffu::Application.app_dir}/engine/config/tasks", :verbose => false
          
          # We include the default files
          cp "#{source_dir}/tasks/package.rake",                "#{Fumoffu::Application.app_dir}/engine/config/tasks", :verbose => false
          cp "#{source_dir}/tasks/generator.rake",              "#{Fumoffu::Application.app_dir}/engine/config/tasks", :verbose => false
          cp "#{source_dir}/templates/build_configuration.rb",  "#{Fumoffu::Application.app_dir}/", :verbose => false
          cp "#{source_dir}/templates/Gemfile",                 "#{Fumoffu::Application.app_dir}/", :verbose => false
          cp "#{source_dir}/templates/Rakefile",                "#{Fumoffu::Application.app_dir}/", :verbose => false
       end
       
       
       protected
       
       def self.generate_engine
          source_dir = File.dirname(__FILE__)+"/templates"
          # We generate the containers
          init_dir = "#{Fumoffu::Application.app_dir}/engine/config/initializers"
          mkdir_p init_dir, :verbose => false

          # We copy the required files
          cp "#{source_dir}/engine/config/initializers/app_classes.rb",     init_dir, :verbose => false
          cp "#{source_dir}/engine/config/initializers/configuration.rb",   init_dir, :verbose => false
          cp "#{source_dir}/engine/config/initializers/init.rb",            init_dir, :verbose => false
          cp "#{source_dir}/engine/config/initializers/java_classes.rb",    init_dir, :verbose => false
          cp "#{source_dir}/engine/config/initializers/ruby_classes.rb",    init_dir, :verbose => false
       end
     end
  end
end