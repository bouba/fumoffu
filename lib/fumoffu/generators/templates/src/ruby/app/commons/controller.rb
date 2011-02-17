class Controller
  attr_accessor :action_name

  def initialize
    @controller_name = extract_controller_name
    @uuid = UUID.new
    @log_msg = Logger['message']
    @log_srv = Logger['server']
  end

  def self.message_processor
    @@message_processor ||= MessageProcessor.new
  end
  
  def extract_controller_name
    name = self.class.to_s
    name.scan(/^(\w+)Controller$/).first.first.downcase
  end
  
  module MessageSender

    # Process the given message
    def process_message
      message = build_message
      @log_msg.debug "Message: "+message
      
      response = Controller.message_processor.send_post @controller_name, @action_name, message

      @log_srv.info "STATUS: "+ response['header']['status'].to_s + " MESSAGE: " + response["data"]["message"].to_s
      return response
    end
    
  end


  module MessageBuilder
    # Loading the controller message layout
    def layout layout_name="application"
      layout_path = "#{LAYOUT_DIR}/#{layout_name.downcase}.json.erb"
      @log_msg.debug "Layout path: "+layout_path
      ERB.new(File.read(layout_path).gsub(/^  /, '')).result(binding)
    end

    # Loading the controller message template
    def template action
      template_path = "#{TEMPLATES_DIR}/#{@controller_name}/#{action}.json.erb"
      @log_msg.debug "Template path: "+template_path
      ERB.new(File.read(template_path).gsub(/^  /, '')).result(binding)
    end


    def build_message
      # we create a request id for the message
      @request_id = @uuid.generate
      
      # we build the message content
      # and we include the message content in the layout
      return layout { template(@action_name).to_s }
    end
  end

end