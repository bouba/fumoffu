require File.dirname(__FILE__)+'/helper'

class FumoffuTest < Test::Unit::TestCase
  
  context "Generators" do
    context "loading" do
      should "successfully load the generator" do
        app = Fumoffu::Application.new
        assert_not_nil app
      end
    end
  end
end