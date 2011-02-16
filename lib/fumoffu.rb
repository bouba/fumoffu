module Fumoffu
  class Application
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