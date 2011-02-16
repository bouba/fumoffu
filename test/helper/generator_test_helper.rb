require File.expand_path("../../",__FILE__).concat('/helper')

require 'rake'
module FumoffuTestHelper
  class GeneratorHelper < Test::Unit::TestCase
    def setup
      tmp_dir = Fumoffu::Application.app_dir
      if not File.exist? ("tmp") then
        sh "mkdir "+tmp_dir+"/tmp"
      end
      Dir.chdir tmp_dir+"/tmp"
    end
  
    def teardown
      Dir.chdir ".."
      sh  "rm -Rf #{Fumoffu::Application.app_dir}/tmp/"
    end
  end
end