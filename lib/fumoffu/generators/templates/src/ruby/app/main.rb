require File.dirname(__FILE__)+'/setup'

####################################################################
#
# Start the APPLICATION
#
####################################################################

# Here MainView should be your Java Swing Main Frame
main_view = MainView.new ApplicationHandler.new
main_view.setVisible true
