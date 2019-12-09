class ApplicationController < ActionController::Base
  include UserHelper
  protect_from_forgery with: :exception
end
