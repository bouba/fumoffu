require 'fumoffu'
# We assume the the name is written in ruby fashion
def update_name name, ref_name
  split_name = name.split "_"
  # check the controller name
  if split_name.last != ref_name.downcase then
    # if it has no controller at the end of the name add it
    split_name << ref_name.downcase
  end
  
  # update the name to class name standard
  split_name.join("_")
end

def generate_name type_class, param
  new_name = param
  raise "Failed to generate a #{type_class}: a #{type_class} name is mandatory." unless not new_name.nil?
  update_name new_name, type_class.capitalize
end

def generate_file name,dir,content
  # create the file
  new_controller_file = File.new("#{dir}/#{name}.rb", "w")
  # add the content
  new_controller_file.write(content)
  # close the file
  new_controller_file.close
end

namespace :fumoffu do
  namespace :generate do
    desc "Generate controller."
    task :controller, :controller_name do |c,args|
      name = generate_name "controller",args[:controller_name] 

      file_content = "class #{name.split("_").collect{|n|n.capitalize!}.join} < ApplicationController\nend"

      generate_file name, "#{Fumoffu::Application.app_dir}/src/ruby/app/actions/controllers", file_content
      puts "The new controller #{name} has been generated."
    end
    
    desc "Generate handler"
    task :handler, :handler_name do |h,args|
      name = generate_name "handler",args[:handler_name] 

      file_content = "class #{name.split("_").collect{|n|n.capitalize!}.join} < Fumoffu::Handler\n"
      file_content<< "    def initialize\n"
      file_content<< "      super\n"
      file_content<< "      @controllers[UIActions::SAMPLE_ACTION] = SampleActionController.new\n"
      file_content<< "    end\n\n\n"
      file_content<< "    def handleAction evt, action, caller\n"
      file_content<< "      # sample of use\n"
      file_content<< "      # if action == UIActions::SAMPLE_ACTION then\n"
      file_content<< "      #     component = component_by_name evt.getSource, \"mainPanel\"\n"
      file_content<< "      #     label     = component_child_by_name component, \"myLabel\"\n"
      file_content<< "      # end\"\n"
      file_content<< "      return false\n"
      file_content<< "    end\n"
      file_content<< "end\n"
      
      generate_file name, "#{Fumoffu::Application.app_dir}/src/ruby/app/actions/handlers", file_content
      puts "The new handler #{name} has been generated."
    end
  end
end