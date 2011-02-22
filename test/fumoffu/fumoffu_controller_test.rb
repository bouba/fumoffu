require File.dirname(__FILE__)+'/helper'

require 'controller'

class SampleController < Fumoffu::Controller
  
end


class FumoffuTest < Test::Unit::TestCase
  
  context "Name extraction" do
    should "successfully extract the controller name" do
      controller = SampleController.new
      assert controller.controller_name, "Sample"
    end
  end
end