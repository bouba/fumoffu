require File.join(File.dirname(__FILE__), '..','helper','generator_test_helper')

require 'fumoffu_config_generator'

class FumoffuGeneratorTest < FumoffuTestHelper::GeneratorHelper
    context "Generate config skeleton" do
      should "successfully generate the config skeleton" do
        Fumoffu::Generators::Configuration.generate
        raise "Add more test"
      end
    end
end