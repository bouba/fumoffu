require File.dirname(__FILE__)+'/helper'

require 'java_mapping'

class JavaTestClass
  attr_accessor :my_str
  attr_java :my_str
  
  private
  
  def setMyStr(str)
    @str = str + "_java"
  end
  
  def getMyStr()
    @str
  end
end

class JavaMappingTest < Test::Unit::TestCase
  context "Classes" do
    should "successfully map java accessor by overriding ruby accessor" do
      test = JavaTestClass.new
      test.my_str = "my_test"
      tested_str = test.my_str

      assert tested_str, "my_str_java"
    end
  end
end