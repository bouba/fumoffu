require File.dirname(__FILE__)+'/helper'

require 'component_search'
require 'handler'
require 'controller'

class SampleController < Fumoffu::Controller
end

class SampleHandler < Fumoffu::Handler
  attr_accessor :controllers
  def initialize
    super
    @controllers["sample_controller"] = SampleController.new
  end
end

class HandlerTest < Test::Unit::TestCase
  
  context "Handlers" do
    context "creating" do
      should "successfully create a handler" do
        obj = Fumoffu::Handler.new
        assert_not_nil obj
      end
    end
    
    context "handling an action" do
       should "successfully handle the action" do
         obj = Fumoffu::Handler.new
         assert_not_nil obj
         assert !obj.handleAction(nil,nil,nil)
       end
       
       should "successufully set action name" do
         obj = SampleHandler.new
         obj.before_action "sample_controller", "sample_action"
         assert obj.controllers["sample_controller"].action_name, "sample_action"
       end
    end
  end
end