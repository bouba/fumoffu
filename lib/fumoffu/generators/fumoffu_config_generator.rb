module Fumoffu
  module Generators
     class Configuration
       def self.generate
          source_dir = File.dirname(__FILE__)
          # We generate the containers
          mkdir_p "#{Fumoffu::Application.app_dir}/config/tasks", :verbose => false
          
          # We include the default files
          cp "#{source_dir}/tasks/package.rake", "#{Fumoffu::Application.app_dir}/config/tasks", :verbose => false
          cp "#{source_dir}/templates/build_configuration.rb", "#{Fumoffu::Application.app_dir}/", :verbose => false
          cp "#{source_dir}/templates/Gemfile", "#{Fumoffu::Application.app_dir}/", :verbose => false
          cp "#{source_dir}/templates/Rakefile", "#{Fumoffu::Application.app_dir}/", :verbose => false
       end
     end
  end
end