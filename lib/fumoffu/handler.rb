# Handlers are use the layerof the application that are interacting directly with 
# the java layer.
module Fumoffu
  class Handler
    include Fumoffu::Utils::ComponentSearch
  
    def initialize
      @controllers = Hash.new
    end

    # This method must be overidden
    def handleAction evt, action, caller
       # DO NOTHING - this method shall be implemented by the children
       return false
    end

  end
end
