require File.join(File.dirname(__FILE__), '..','helper','generator_test_helper')

require 'fumoffu_src_generator'

class FumoffuSourceGeneratorTest < Test::Unit::TestCase
    include FumoffuTestHelper::GeneratorHelper
    context "Generate source skeleton" do
      should "successfully generate the source skeleton" do
        Fumoffu::Generators::Source.generate
        #we check that all the directories have been created
        @dir_structure = [
          "src",
          "src/java",
          "src/java/org",
          "src/java/org/github",
          "src/java/org/github/bouba",
          "src/java/org/github/bouba/fumoffu",
          "src/java/org/github/bouba/fumoffu/ActionManager.java",
          "src/java/org/github/bouba/fumoffu/UIActions.java",
          "src/java/org/rubyforge",
          "src/java/org/rubyforge/rawr",
          "src/java/org/rubyforge/rawr/Main.java",
          "src/ruby",
          "src/ruby/app",
          "src/ruby/app/main.rb",
          "src/ruby/app/setup.rb",
          "src/ruby/app/actions",
          "src/ruby/app/actions/controllers",
          "src/ruby/app/actions/controllers/application_controller.rb",
          "src/ruby/app/actions/handlers",
          "src/ruby/app/actions/handlers/application_handler.rb",
          "src/ruby/app/actions/helpers",
          "src/ruby/app/commons",
          "src/ruby/app/models",
          "src/ruby/system/configuration.rb",
          "src/ruby/system/initializers",
          "src/ruby/system/initializers/app_classes.rb",
          "src/ruby/system/initializers/init.rb",
          "src/ruby/system/initializers/java_classes.rb",
          "src/ruby/system/initializers/ruby_classes.rb"
         ]
         check_files @dir_structure, @tmp_dir
      end
    end
end