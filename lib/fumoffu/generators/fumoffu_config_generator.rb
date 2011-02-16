module Fumoffu
  module Generators
     class FumoffuConfigGenerator
       def self.generate
          source_dir = File.dirname("./",__FILE__)
          # We generate the containers
          sh "mkdir config"
          sh "mkdir config/tasks"
          
          # We include the default files
          sh "cp #{source_dir}/tasks/package.rake config/tasks"
       end
     end
  end
end