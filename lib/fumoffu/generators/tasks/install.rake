require "rubygems"
require File.expand_path("../",__FILE__).concat("/fumoffu_generator")

namespace :fumoffu do
  desc "Initialize the fumoffu project"
  task "install" do
    FumoffuGenerator.generate
  end
end