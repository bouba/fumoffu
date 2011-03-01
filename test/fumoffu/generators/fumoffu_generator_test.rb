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
          "lib",
          "lib/java",
          "lib/ruby",
          "log",
          "resources",
          "resources/medias",
          "scripts",
          "scripts/package.sh",
          "scripts/start.sh",
          "src",
          "src/java",
          "src/java/org",
          "src/java/org/rubyforge",
          "src/java/org/rubyforge/rawr",
          "src/ruby",
          "src/ruby/app",
          "src/ruby/app/actions",
          "src/ruby/app/actions/controllers",
          "src/ruby/app/actions/handlers",
          "src/ruby/app/actions/helpers",
          "src/ruby/app/commons",
          "src/ruby/app/models",
          "src/ruby/system", 
          "src/ruby/system/initializers", 
          "test",
          "test/java",
          "test/ruby",
          "test/ruby/spec"
         ]
         check_files @dir_structure, @tmp_dir

      end
    end
end