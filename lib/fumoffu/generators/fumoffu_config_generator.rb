module Fumoffu
  module Generators
     class Configuration
       def self.generate
          source_dir = File.dirname(__FILE__)
          # We generate the containers
          mkdir_p "#{Fumoffu::Application.app_dir}/config"
          mkdir_p "#{Fumoffu::Application.app_dir}/config/tasks"
          
          # We include the default files
          cp "#{source_dir}/tasks/package.rake", "#{Fumoffu::Application.app_dir}/config/tasks"
       end
     end
  end
end