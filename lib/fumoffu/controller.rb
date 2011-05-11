module Fumoffu
  
=begin rdoc
  Controller is the layer which process the information.
=end
  class Controller
    # Used when generating a new controller
    attr_reader :controller_name 

    def initialize
      @controller_name = extract_controller_name
    end
  
    def extract_controller_name
      name = self.class.to_s
      name.scan(/^\w+Controller$/).first.downcase
    end
  end
end