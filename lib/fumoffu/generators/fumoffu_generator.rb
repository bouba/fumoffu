Dir[File.dirname(__FILE__).concat("/*.rb")].each {|file| require file }

module Fumoffu
  module Generators
     class Application

       public
       def self.template_dir
         "#{File.dirname(__FILE__)}/templates"
       end

       def self.generate
         # we generate the configuration
         Configuration.generate
         Lib.generate
         Source.generate

         cp_r "#{Fumoffu::Generators::Application.template_dir}/scripts", "#{Fumoffu::Application.app_dir}/", :verbose => false

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
