require "rubygems"

BUILD_DIR="build" # the directory used for the compilation
GEM_DIR="#{ROOT_DIR}/engine/lib/ruby/jruby/1.8/gems"
JRUBY_COMPLETE="#{ROOT_DIR}/engine/lib/java/jruby-complete.jar"

def create_dir dir
  if File.exist?(dir) then 
    puts dir+" already exists: skip"
  else
    sh "mkdir #{dir}";
    puts dir+" has been created"
  end
end

namespace :fumoffu do
  namespace :bundler do
    desc "create gems bundle pacakage"
    task "jar" do
      # we setup the building directory
      create_dir BUILD_DIR

      # compile vendor dependencies
      puts "Compiling vendor"
      current_dir = ROOT_DIR
      Dir.foreach(GEM_DIR) do |d| 
        Dir.chdir(GEM_DIR+"/"+d) do
          puts "Dir: "+d
          sh "jrubyc lib -t #{current_dir}/#{BUILD_DIR}"
        end unless [".", "..", ".DS_Store"].include? d
      end
      puts "Done"

      # we create the jar in the package dir
      dependencies = "#{ROOT_DIR}/engine/lib/java/generated/"

      puts "Create the bundled gem jar"
      sh "jar cvf bundled_gems.jar -C #{BUILD_DIR} ."
      sh "mv bundled_gems.jar #{dependencies}"
      #sh "cp #{JRUBY_COMPLETE} #{dependencies}"
      puts "Done ..."
    end
  end

  desc "Clean the build dir"
  task "clean" do
    puts "Cleaning up the build directory"
    sh "rm -Rf #{BUILD_DIR}/"
    puts "Done ..."
  end
end