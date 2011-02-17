module Fumoffu
  module Generators
     class Lib
       def self.generate
         generate_dirs
         copy_libraries
       end
       
       def self.generate_dirs
         @@source_dir = File.dirname(__FILE__)
         # We generate the containers
         mkdir_p "#{Fumoffu::Application.app_dir}/lib", :verbose => false
         mkdir_p "#{Fumoffu::Application.app_dir}/lib/java", :verbose => false
         mkdir_p "#{Fumoffu::Application.app_dir}/lib/generated", :verbose => false
         mkdir_p "#{Fumoffu::Application.app_dir}/lib/ruby", :verbose => false
       end
       
       
       def self.copy_libraries
         cp_r "#{@@source_dir}/templates/lib/java", "#{Fumoffu::Application.app_dir}/lib/", :verbose => false
       end
     end
  end
end