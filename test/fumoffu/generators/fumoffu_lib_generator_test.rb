require File.join(File.dirname(__FILE__), '..','helper','generator_test_helper')

require 'fumoffu_lib_generator'

class FumoffuLibGeneratorTest < Test::Unit::TestCase
    include FumoffuTestHelper::GeneratorHelper
    context "Generate config skeleton" do
      should "successfully generate the config skeleton" do
        Fumoffu::Generators::Configuration.generate
        #we check that all the directories have been created
        @dir_structure = [
          "lib",
          "lib/java",
          "lib/java/generated",
          "lib/java/AbsoluteLayout.jar",
          "lib/java/swing-layout.jar",
          "lib/ruby"
         ]
         check_files @dir_structure, @tmp_dir
      end
    end
end