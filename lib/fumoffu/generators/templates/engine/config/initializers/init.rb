# INITIALIZE THE APP
# IMPORT ALL THE JAVA LIBRARY IN THE PROJECT

require File.dirname(__FILE__)+'/ruby_classes'
require File.dirname(__FILE__)+'/java_classes'

puts "Setting up the configuration ..."
$log = Logger.new(STDOUT)

require File.dirname(__FILE__)+'/app_classes'