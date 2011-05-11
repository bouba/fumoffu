# Include local files
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'fumoffu'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'fumoffu','generators'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'fumoffu','utils'))

=begin rdoc
    Fumoffu is a JRuby / Java Swing Framework which enabling users to easily design and create crossplatform desktop application.

    The framework goal primary goals are:

    * Develop a cross-platform UI (Windows, OSX, Linux)
    * Easily and quickly package and deploy the application
    * Easily setup the development environment

    More information checkout the project on github. http://github.com/bouba/fumoffu
    
    == Architecture
    
    Fumoffu is mainly structured in 4 layers: 
    
    * The view: in the interface folder which fully coded in Java.
    * The handler: in the engine folder, which receive the events from the upper layer. This layer is a mix between Java and Ruby.
    * The controller: in the engine folder, which process the information retrieved in the handler layer. This layer is in Ruby only.
    * The model: in the engine layer, which access and process the application core data.
=end
module Fumoffu
   
=begin rdoc
  Application is core structure supporting your application
  it loads all the elements, tools required to run your application
  
  -- NB: Currently the class is mainly used to setup the skeleton of the framework
=end
  class Application
    @@app_dir = Dir.pwd

    # The ROOT folder of your application
    def self.app_dir
       @@app_dir
    end
    
    # Enable to custom the location of your ROOT folder
    def self.app_dir=new_loc
       @@app_dir = new_loc
    end
    
    def initialize
      load_all
    end
    
    private
    
    # load all the element available to run a Fumoffu application
    def load_all
      load_generators
      load_java_mapping
      load_utils
      load_default
    end

    # load the required element to run a Fumoffu application
    def load_default
      require 'controller'
      require 'handler'
    end
    
    # load the element used to generate the skeleton of a Fumoffu application
    def load_generators
      require "fumoffu_generator"
    end
    
    # load element used for mapping Ruby and Java Getter and Setter method (The mapping is based on the Standard Ruby and Java Norm)
    def load_java_mapping
      require 'java_mapping'
    end
    
    # load helpful utils used in a Fumoffu application
    def load_utils
      require 'component_search'
    end
  end
end