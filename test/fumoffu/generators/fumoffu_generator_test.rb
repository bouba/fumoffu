require File.join(File.dirname(__FILE__), '..','helper','generator_test_helper')

require 'fumoffu_generator'

class FumoffuGeneratorTest < Test::Unit::TestCase
    include FumoffuTestHelper::GeneratorHelper
    context "Generate app skeleton" do
      should "successfully generate the full app skeleton" do
        Fumoffu::Generators::Application.generate
        #we check that all the directories have been created
        @dir_structureo = [
          "dist",
          "lib",
          "lib/java",
          "lib/ruby",
          "log",
          "resources",
          "resources/medias",
          "scripts",
          "src",
          "src/java",
          "src/ruby",
          "src/ruby/app",
          "src/ruby/config",
          "test",
          "test/java",
          "test/ruby",
          "test/ruby/spec"
         ]
         check_files @dir_structureo, @tmp_dir

      end
    end
end