require File.join(File.dirname(__FILE__), '..','helper','generator_test_helper')

require 'fumoffu_config_generator'

class FumoffuConfigGeneratorTest < Test::Unit::TestCase
    include FumoffuTestHelper::GeneratorHelper
    context "Generate config skeleton" do
      context "for application engine component" do
        should "successfully generate the config skeleton" do
          Fumoffu::Generators::Configuration.generate
          #we check that all the directories have been created
          @dir_structure = [
            "engine/config/initializers/app_classes.rb",
            "engine/config/initializers/configuration.rb",
            "engine/config/initializers/init.rb",
            "engine/config/initializers/java_classes.rb",
            "engine/config/initializers/ruby_classes.rb",
            "engine/config/tasks/generator.rake",
            "engine/config/tasks/package.rake "
           ]
           check_files @dir_structure, @tmp_dir
        end
      end
    end
end