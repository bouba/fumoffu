# ================================
# IMPORT ALL CLASS AND FILES FROM THE PROJECT
#


def import_from_jar
  #  Example
  #  this is used to import java generated file from the jar 
  #  within the application which will be running in java
  #  you need to put the name of all the required class
  %w[
    controller
    handler
    application_controller
    application_handler
    ].each do |c|
        require c
    end

end

def import_for_ruby
  lib_dir = ROOT_DIR+"/src/ruby/app"

  dirs = [
    "utils",
    "commons",
    "models",
    "actions/controllers",
    "actions/helpers",
    "actions/handlers"
    ]
  
   # Example of additional src directory
   #  dirs << "db"

  dirs.each do |dir|
    Dir[lib_dir+"/#{dir}/*.rb"].each {|file| require file }
  end
end

IS_FROM_JAR ? import_from_jar : import_for_ruby
