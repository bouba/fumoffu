#
# ActionManager is the a Abstract Class which used within the swing
# UI to handle a actions
# 
# In the Fumoffu FrameWork All processed action should go through the ApplicationHandler
#

class ApplicationHandler < ActionManager

  def initialize
    @handlers = Array.new
  end

  # java.awt.event.ActionEvent event, String action, Component caller
  def handleAction event, action, caller
    begin
      @handlers.each do |handler|
        return true unless not handler.handleAction(event, action, caller)
      end

    rescue => e
      # FIXME INTEGRATE THE RUBY LOGGER
      puts "Failed to process action: '#{action.to_s}' "+e.backtrace.join("\n")+":\n "+e.inspect
    end
    return false
  end
end
