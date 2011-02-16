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
    end
    
    def load_generators
      require File.dirname(__FILE__).concat("/fumoffu/generators/fumoffu_generator")
    end
  end
end