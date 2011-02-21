# Include local files
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'fumoffu'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'fumoffu','generators'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'fumoffu','utils'))

module Fumoffu
  class Application
    @@app_dir = Dir.pwd

    def self.app_dir
       @@app_dir
    end
    
    def self.app_dir=new_loc
       @@app_dir = new_loc
    end
    
    def initialize
      load_all
    end
    
    private
    
    def load_all
      load_generators
      load_java_mapping
      load_utils
    end
    
    def load_generators
      require "fumoffu_generator"
    end
    
    def load_java_mapping
      require 'java_mapping'
    end
    
    def load_utils
      require 'component_search'
    end
  end
end