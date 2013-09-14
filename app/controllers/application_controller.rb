class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper
  include SessionHelper

  before_filter :require_login
end
