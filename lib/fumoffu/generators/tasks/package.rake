require "rubygems"


BUILD_DIR="build" # the directory used for the compilation
TARGET_DIRS=[ "lib", "config"] # The list of folders containing the sources that require compilation
GEM_DIR="#{ROOT_DIR}/lib/ruby/jruby/1.8/gems"
JRUBY_COMPLETE="#{ROOT_DIR}/lib/java/jruby-complete.jar"

def create_dir dir
  if File.exist?(dir) then 
    puts dir+" already exists: skip"
  else
    sh "mkdir #{dir}";
    puts dir+" has been created"
  end
end

def setup_other_files dir
  # we copy the resources and dependencies
  puts "Copy the resources and dependencies"
  create_dir "#{dir}/config"
  create_dir "#{dir}/log"
  
  sh "cp -R config/*.yml #{dir}/config/"
  sh "cp -R config/templates #{dir}/config/"
  sh "cp scripts/start.sh #{dir}/start.sh"
end

namespace :pkg do
  namespace :rawr do
    desc "create gems bundle pacakage"
    task "bundle_jar" do
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
      dependencies = "#{ROOT_DIR}/lib/java/generated/"

      puts "Create the bundled gem jar"
      sh "jar cvf bundled_gems.jar -C #{BUILD_DIR} ."
      sh "mv bundled_gems.jar #{dependencies}"
      #sh "cp #{JRUBY_COMPLETE} #{dependencies}"
      puts "Done ..."
    end
    
    desc "Add files conf,image ..."
    task "add_files" do
      setup_other_files "dist/jar"
    end
  end
  
  
  
  desc "Clean the build dir"
  task "clean" do
    puts "Cleaning up the build directory"
    sh "rm -Rf #{BUILD_DIR}/"
    puts "Done ..."
  end
end