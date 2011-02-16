require 'helper'

module Fumoffu
end

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