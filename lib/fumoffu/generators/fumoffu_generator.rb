require File.dirname(__FILE__).concat('/fumoffu_config_generator')

module Fumoffu
  module Generators
     class Application
       def self.generate
         # we generate the configuration
         Configuration.generate

         # We generate the sources from where it is executed
         @dir_structure = [
           "dist",
           "lib",
           "lib/java",
           "lib/ruby",
           "log",
           "resources",
           "resources/medias",
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
           
         @dir_structure.each do |dir|
           mkdir_p "#{Fumoffu::Application.app_dir}/#{dir}", :verbose => false
         end
       end
     end
  end
end
