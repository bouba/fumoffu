include_class 'org.wc.ActionManager'
include_class 'org.wc.AvailableActions'

class ApplicationHandler < ActionManager

  def initialize
    @handlers = Array.new
    @handlers << MainMenuHandler.new
    @handlers << SessionsHandler.new

    setup_loggers 'app', [Outputter.stdout, $file_output]
    
  end

  # java.awt.event.ActionEvent event, String action
  def handleAction event, action, caller
    begin
      @handlers.each do |handler|
        return true unless not handler.handleAction(event, action, caller)
      end

    rescue => e
      $log_main_app.error "Failed to process action: '#{action.to_s}' "+e.backtrace.join("\n")+":\n "+e.inspect
    end
    return false
  end
end
