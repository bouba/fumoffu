module Fumoffu
  module Generators
     class Lib
       def self.generate
         @@source_dir = File.dirname(__FILE__)
         generate_dirs
         copy_libraries
       end
       
       def self.generate_dirs
         # We generate the containers
         mkdir_p "#{Fumoffu::Application.app_dir}/lib/java/generated", :verbose => false
         mkdir_p "#{Fumoffu::Application.app_dir}/lib/ruby", :verbose => false
       end
       
       
       def self.copy_libraries
         cp_r "#{@@source_dir}/templates/lib/java", "#{Fumoffu::Application.app_dir}/lib/", :verbose => false
       end
     end
  end
end