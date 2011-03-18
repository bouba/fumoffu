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

  # java.awt.event.ActionEvent event, String action, Component output container
  def handleAction event, action, output_container
    begin
      @handlers.each do |handler|
        return true unless not handler.handleAction(event, action, output_container)
      end

    rescue => e
      # FIXME INTEGRATE THE RUBY LOGGER
      puts "Failed to process action: '#{action.to_s}' "+e.backtrace.join("\n")+":\n "+e.inspect
    end
    return false
  end
end
