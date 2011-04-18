####################################################################
#
# SETUP THE APPLICATION ROOT DIR
#
####################################################################
require 'pathname'

dir = "#{Pathname.new(__FILE__).dirname}".scan(/(.*)\/\w+.jar\!/)
if dir.size > 0 then
  IS_FROM_JAR = true
  ROOT_DIR = dir[0][0].scan(/file:(.+)/)[0][0]
else
  IS_FROM_JAR = false
  ROOT_DIR = "#{Pathname.new(__FILE__).dirname}/../../../"
end
puts "ROOT_DIR: #{ROOT_DIR}"
### Setup the application running environment

APP_ENV ||= "development"


####################################################################
#
# LOAD Default class dirs
# 
####################################################################
$LOAD_PATH << "lib" # Adding rubygems classes

[
  "utils",
  "commons",
  "models",
  "actions/controllers",
  "actions/handlers"].each do |d|
  $LOAD_PATH << "#{d}"
end


####################################################################
#
# Application Initializer
# 
####################################################################
if IS_FROM_JAR then
  require 'initializers/init'
  require "initializers/configuration"
else
  require ROOT_DIR+'/engine/config/initializers/init'
  require ROOT_DIR+"/engine/config/initializers/configuration"
end