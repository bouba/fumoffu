require File.join(File.dirname(__FILE__), '..','helper','generator_test_helper')

require 'fumoffu_src_generator'

class FumoffuSourceGeneratorTest < Test::Unit::TestCase
    include FumoffuTestHelper::GeneratorHelper
    context "Generate config skeleton" do
      should "successfully generate the config skeleton" do
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
          "src/ruby/app/actions",
          "src/ruby/app/actions/controllers",
          "src/ruby/app/actions/controllers/application_controller.rb",
          "src/ruby/app/actions/handlers",
          "src/ruby/app/actions/handlers/application_handler.rb",
          "src/ruby/app/actions/helpers",
          "src/ruby/app/commons",
          "src/ruby/app/models",
          "src/ruby/app/utils",
          "src/ruby/config/configuration.rb",
          "src/ruby/config/initializers",
          "src/ruby/config/initializers/app_classes.rb",
          "src/ruby/config/initializers/init.rb",
          "src/ruby/config/initializers/java_classes.rb",
          "src/ruby/config/initializers/ruby_classes.rb"
         ]
         check_files @dir_structure, @tmp_dir
      end
    end
end