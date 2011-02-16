module Fumoffu
  module Generators
     class Configuration
       def self.generate
          source_dir = Fumoffu::Application.app_dir
          # We generate the containers
          sh "mkdir #{source_dir}/config"
          sh "mkdir #{source_dir}/config/tasks"
          
          # We include the default files
          sh "cp #{source_dir}/tasks/package.rake config/tasks"
       end
     end
  end
end