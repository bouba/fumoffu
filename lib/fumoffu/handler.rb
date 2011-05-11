# Handlers are use the layerof the application that are interacting directly with 
# the java layer.
module Fumoffu
  class Handler
    include Fumoffu::Utils::ComponentSearch
  
    def initialize
    end

    # This method must be overidden  
    # The application handler will delegate the event handling to other handlers
    # through this method.  
    #
    # This method enable the handler to catch the events
    def handleAction evt, action, caller
       # DO NOTHING - this method shall be implemented by the children
       return false
    end

  end
end
