module Fumoffu
  module Generators
     class Lib
       def self.generate
         generate_dirs
         copy_libraries
       end
       
       def self.generate_dirs
         # We generate the containers
         mkdir_p "#{Fumoffu::Application.app_dir}/engine/lib/java/generated", :verbose => false
         mkdir_p "#{Fumoffu::Application.app_dir}/engine/lib/ruby", :verbose => false
         mkdir_p "#{Fumoffu::Application.app_dir}/interface/lib", :verbose => false
       end
       
       
       def self.copy_libraries
         source_dir = File.dirname(__FILE__)+"/templates"
         cp   "#{source_dir}/interface/lib/AbsoluteLayout.jar", "#{Fumoffu::Application.app_dir}/interface/lib", :verbose => false
         cp   "#{source_dir}/interface/lib/SwingLayout.jar",   "#{Fumoffu::Application.app_dir}/interface/lib", :verbose => false
       end
     end
  end
end