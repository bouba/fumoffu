require File.join(File.dirname(__FILE__), '..','helper','generator_test_helper')

require 'fumoffu_src_generator'

class FumoffuSourceGeneratorTest < Test::Unit::TestCase
    include FumoffuTestHelper::GeneratorHelper
    context "Generate source skeleton" do
      should "successfully generate the source skeleton" do
        Fumoffu::Generators::Source.generate
        #we check that all the directories have been created
        @dir_structure = [
          "interface/src/org/github/bouba/fumoffu/ActionManager.java",
          "interface/src/org/github/bouba/fumoffu/UIActions.java",
          "interface/src/org/rubyforge/rawr/Main.java",
          "engine/src/main.rb",
          "engine/src/setup.rb",
          "engine/src/actions/controllers/application_controller.rb",
          "engine/src/actions/handlers/application_handler.rb",
          "engine/src/commons",
          "engine/src/models",
         ]
         check_files @dir_structure, @tmp_dir
      end
    end
end