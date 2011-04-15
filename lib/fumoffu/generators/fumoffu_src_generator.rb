module Fumoffu
  module Generators
     class Source
       def self.generate
         @@source_dir = File.dirname(__FILE__)
         generate_dirs
         copy_sources
       end

       def self.generate_dirs
         # We generate the containers
         mkdir_p "#{Fumoffu::Application.app_dir}/interface/src",       :verbose => false
         mkdir_p "#{Fumoffu::Application.app_dir}/engine/src",          :verbose => false
         mkdir_p "#{Fumoffu::Application.app_dir}/engine/test",         :verbose => false
         mkdir_p "#{Fumoffu::Application.app_dir}/engine/src/commons",  :verbose => false
         mkdir_p "#{Fumoffu::Application.app_dir}/engine/src/models",   :verbose => false
       end


       def self.copy_sources
         cp_r "#{@@source_dir}/templates/engine/src/.",     "#{Fumoffu::Application.app_dir}/engine/src",     :verbose => false
         cp_r "#{@@source_dir}/templates/interface/src/.",  "#{Fumoffu::Application.app_dir}/interface/src",  :verbose => false
         cp_r "#{@@source_dir}/templates/engine/test/.",    "#{Fumoffu::Application.app_dir}/engine/test",    :verbose => false
       end
     end
  end
end