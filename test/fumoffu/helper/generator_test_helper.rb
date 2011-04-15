require File.expand_path("../../",__FILE__).concat('/helper')

include FileUtils

ROOT_DIR = Fumoffu::Application.app_dir = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", ".."))

module FumoffuTestHelper
  module GeneratorHelper
    def setup
      @tmp_dir = ROOT_DIR+"/tmp"
      mkdir_p @tmp_dir, :verbose => false

      Fumoffu::Application.app_dir = @tmp_dir
    end

    def teardown
      rm_r @tmp_dir, :verbose => false
    end

    def check_files paths, app_dir=nil
      paths.each do |path|
        # we check the existance of component of the path
        path_files = path.scan(/\/*\w+\/|\w+[\.\w+]*/)
        check_path = String.new
        path_files.each do |file|
          check_path.concat(file)
          new_path = app_dir.nil? ? check_path : "#{app_dir}/#{check_path}" # check if the app_dir has been set
          assert File.exist?(new_path), "The file or directory #{path} does not exist"
        end
      end
    end
  end
end