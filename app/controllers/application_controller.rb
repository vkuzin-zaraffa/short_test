class ApplicationController < ActionController::Base
  def client_ip
    request.remote_ip
  end
end
