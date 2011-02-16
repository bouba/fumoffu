require File.join(File.dirname(__FILE__), '..','helper','generator_test_helper')

require 'fumoffu_config_generator'

class FumoffuGeneratorTest < Test::Unit::TestCase
    include FumoffuTestHelper::GeneratorHelper
    context "Generate config skeleton" do
      should "successfully generate the config skeleton" do
        Fumoffu::Generators::Configuration.generate
        #we check that all the directories have been created
        @dir_structureo = [
          "config",
          "config/tasks",
          "config/tasks/package.rake"
         ]
         check_files @dir_structureo, @tmp_dir
      end
    end
end