Dir[File.dirname(__FILE__).concat("/*.rb")].each {|file| require file }

module Fumoffu
  module Generators
     class Application
       def self.generate
         # we generate the configuration
         Configuration.generate
         Lib.generate
         Source.generate

         # We generate the sources from where it is executed
         @dir_structure = [
           "dist",
           "log",
           "resources/medias",
           "scripts",
           "test/java",
           "test/ruby/spec"
           ]
           
         @dir_structure.each do |dir|
           mkdir_p "#{Fumoffu::Application.app_dir}/#{dir}", :verbose => false
         end
       end
     end
  end
end
