Dir[File.dirname(__FILE__).concat("/*.rb")].each {|file| require file }

module Fumoffu
  module Generators
     class Application

       def self.generate
         # we generate the configuration
         Configuration.generate
         Lib.generate
         Source.generate

         cp_r "#{File.dirname(__FILE__)}/templates/scripts", "#{Fumoffu::Application.app_dir}/", :verbose => false

         # We generate the sources from where it is executed
         @dir_structure = [
           "dist",
           "engine/log",
           "engine/resources",
           "interface/resources/medias",
           "scripts",
           "interface/test",
           "engine/test/spec"
           ]
           
         @dir_structure.each do |dir|
           mkdir_p "#{Fumoffu::Application.app_dir}/#{dir}", :verbose => false
         end
       end
     end
  end
end
