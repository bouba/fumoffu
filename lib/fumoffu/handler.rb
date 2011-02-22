module Fumoffu
  class Handler
    include Fumoffu::Utils::ComponentSearch
  
    def initialize
      @controllers = Hash.new
    end


    def handleAction evt, action, caller
       # DO NOTHING - this method shall be implemented by the children
       return false
    end

    # setup the controller before executing an action
    def before_action controller_id, action
      @controllers[controller_id].action_name = action
    end
  end
end
