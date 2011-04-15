require File.dirname(__FILE__)+'/setup'

####################################################################
#
# Start the APPLICATION
#
####################################################################

# Here MainView should be your Java Swing Main Frame
$log.debug "Starting the application"
$ah = ApplicationHandler.new
main_view = MainView.new $ah
main_view.setVisible true
