class ApplicationController < Controller
  include Controller::MessageSender
  include Controller::MessageBuilder

end
