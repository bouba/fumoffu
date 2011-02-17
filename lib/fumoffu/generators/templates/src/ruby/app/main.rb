# INIT THE RIGHT ROOT_DIR
dir = "#{File.dirname(__FILE__)}".scan(/(.*)\/\w+.jar\!/)
if dir.size > 0 then
  IS_FROM_JAR = true
  ROOT_DIR = dir
else
  IS_FROM_JAR = false
  ROOT_DIR = "#{File.dirname(__FILE__)}/../../../"
end

APP_ENV ||= "development"

$LOAD_PATH << "lib"
[
  "utils",
  "commons",
  "models",
  "actions/controllers", 
  "actions/helpers", 
  "actions/handlers"].each do |d|
  $LOAD_PATH << "app/#{d}"
end

require File.dirname(__FILE__)+'/../config/initializers/init'
require File.dirname(__FILE__)+"/../config/configuration"

# ----------------------------------------------------
# ----------------------------------------------------
# Application start

# =======================================
# LAUNCH THE APPLICATION
# =======================================

# Here MainView should be your Java Swing Main Frame
main_view = MainView.new ApplicationHandler.new
main_view.setVisible true