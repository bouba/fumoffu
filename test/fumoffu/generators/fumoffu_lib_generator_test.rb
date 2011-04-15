require File.join(File.dirname(__FILE__), '..','helper','generator_test_helper')

require 'fumoffu_lib_generator'

class FumoffuLibGeneratorTest < Test::Unit::TestCase
    include FumoffuTestHelper::GeneratorHelper
    context "Generate library skeleton" do
      should "successfully generate the library skeleton" do
        Fumoffu::Generators::Lib.generate
        #we check that all the directories have been created
        @dir_structure = [
          "engine/lib/java",
          "engine/lib/ruby",
          "interface/lib/AbsoluteLayout.jar",
          "interface/lib/SwingLayout.jar",
         ]
         check_files @dir_structure, @tmp_dir
      end
    end
end