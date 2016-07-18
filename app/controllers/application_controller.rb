class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  require_relative '../../lib/helpers/config' # This should be protected!
end
