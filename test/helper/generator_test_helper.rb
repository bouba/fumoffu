require File.expand_path("../../",__FILE__).concat('/helper')

require 'rake'
module FumoffuTestHelper
  class GeneratorHelper < Test::Unit::TestCase
    def setup
      if not File.exist? ("tmp") then
        sh "mkdir "+@tmp_dir
      end
      Dir.chdir @tmp_dir
      @tmp_dir = Fumoffu::Application.app_dir
    end
  
    def teardown
      Dir.chdir ".."
      sh  "rm -Rf #{@tmp_dir}"
    end
  end
end