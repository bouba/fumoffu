require File.expand_path("../../",__FILE__).concat('/helper')

require 'file_utils'

ROOT_DIR = Fumoffu::Application.app_dir = File.expand_path(File.join(File.dirname(__FILE__), "..", ".."))

module FumoffuTestHelper
  module GeneratorHelper
    def setup
      Dir.chdir ROOT_DIR
      @tmp_dir = ROOT_DIR+"/tmp"
      mkdir_p @tmp_dir, :verbose => false
      Dir.chdir @tmp_dir

      Fumoffu::Application.app_dir = @tmp_dir
    end

    def teardown
      rm_r @tmp_dir, :verbose => false
    end

    def check_files files, app_dir=nil
      files.each do |file|
        path = app_dir.nil? ? file : "#{app_dir}/#{file}"
        assert File.exist?(path), "The file or directory #{path} does not exist"
      end
    end
  end
end