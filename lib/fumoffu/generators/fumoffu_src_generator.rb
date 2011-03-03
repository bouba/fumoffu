module Fumoffu
  module Generators
     class Source
       def self.generate
         @@source_dir = File.dirname(__FILE__)
         copy_sources
         generate_dirs
       end
       
       def self.generate_dirs
         # We generate the containers
         mkdir_p "#{Fumoffu::Application.app_dir}/src/java", :verbose => false
         mkdir_p "#{Fumoffu::Application.app_dir}/src/ruby/app/actions/helpers", :verbose => false
         mkdir_p "#{Fumoffu::Application.app_dir}/src/ruby/app/commons", :verbose => false 
         mkdir_p "#{Fumoffu::Application.app_dir}/src/ruby/app/models", :verbose => false 
       end
       
       
       def self.copy_sources
         cp_r "#{@@source_dir}/templates/src/", "#{Fumoffu::Application.app_dir}/", :verbose => false
       end
     end
  end
end