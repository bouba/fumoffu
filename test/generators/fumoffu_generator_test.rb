require File.join(File.dirname(__FILE__), '..','helper','generator_test_helper')

require 'fumoffu_generator'

class FumoffuGeneratorTest < FumoffuTestHelper::GeneratorHelper
    context "Generate app skeleton" do
      should "successfully generate the full app skeleton" do
        Fumoffu::Generators::Application.generate
        raise "Add more test"
      end
    end
end