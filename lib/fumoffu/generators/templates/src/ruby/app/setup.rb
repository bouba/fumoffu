####################################################################
#
# SETUP THE APPLICATION ROOT DIR
#
####################################################################

dir = "#{File.dirname(__FILE__)}".scan(/(.*)\/\w+.jar\!/)
if dir.size > 0 then
  IS_FROM_JAR = true
  ROOT_DIR = dir
else
  IS_FROM_JAR = false
  ROOT_DIR = "#{File.dirname(__FILE__)}/../../../"
end

### Setup the application running environment

APP_ENV ||= "development"


####################################################################
#
# LOAD Default class dirs
# 
####################################################################
[
  "utils",
  "commons",
  "models",
  "actions/controllers",
  "actions/helpers",
  "actions/handlers"].each do |d|
  $LOAD_PATH << "app/#{d}"
end


####################################################################
#
# Application Initializer
# 
####################################################################
require File.dirname(__FILE__)+'/../config/initializers/init'
require File.dirname(__FILE__)+"/../config/configuration"