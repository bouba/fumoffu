require 'fumoffu_config_generator'

module Fumoffu
  module Generators
     class FumoffuGenerator
       def self.generate
         # we generate the configuration
         FumoffuConfigGenerator.generate
         
         # We generate the sources from where it is executed
         @dir_structure = [
           "dist",
           "lib",
           "lib/java",
           "lib/ruby"
           "log",
           "resources",
           "resources/medias"
           "scripts",
           "src",
           "src/java",
           "src/ruby",
           "src/ruby/app",
           "src/ruby/config",
           "test",
           "test/java",
           "test/ruby",
           "test/ruby/spec"
           ]

         @dir_structure.each do |new_dir|
           sh "mkdir #{new_dir}"
         end
        
       end
     end
  end
end
