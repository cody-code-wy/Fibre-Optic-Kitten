class ApplicationController < ActionController::Base
  protected
  require_relative '../../lib/helpers/config'
  protect_from_forgery with: :exception
end
