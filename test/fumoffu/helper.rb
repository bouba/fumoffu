require 'rubygems'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..','..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..','..', 'lib','fumoffu'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..','..', 'lib','fumoffu','generators'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..','..', 'lib','fumoffu','utils'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'fumoffu'

class Test::Unit::TestCase
  def setup
  end
  
  def teardown
  end
end