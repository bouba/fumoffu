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

  end
end
