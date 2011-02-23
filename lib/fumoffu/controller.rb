module Fumoffu
  class Controller
    attr_accessor :action_name
    attr_reader :controller_name

    def initialize
      @controller_name = extract_controller_name
    end
  
    def extract_controller_name
      name = self.class.to_s
      name.scan(/^(\w+)Controller$/).first.first.downcase
    end
  end
end