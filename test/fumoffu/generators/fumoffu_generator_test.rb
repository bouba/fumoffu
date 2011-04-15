require File.join(File.dirname(__FILE__), '..','helper','generator_test_helper')

require 'fumoffu_generator'

class FumoffuGeneratorTest < Test::Unit::TestCase
    include FumoffuTestHelper::GeneratorHelper
    context "Generate app skeleton" do
      should "successfully generate the full app skeleton" do
        Fumoffu::Generators::Application.generate
        #we check that all the directories have been created
        @dir_structure = [
          "dist",
          "engine/log",
          "engine/resources",
          "interface/resources/medias",
          "scripts/package.sh",
          "engine/src/main.rb",
          "engine/src/actions/controllers",
          "engine/src/actions/handlers",
          "engine/src/commons",
          "engine/src/models",
          "engine/test/spec/spec_helper.rb",
          "interface/src/org/rubyforge/rawr",
          "interface/test",
         ]
         check_files @dir_structure, @tmp_dir
      end
    end
end