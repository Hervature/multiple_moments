class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_headers

  def get_headers
    @navbar_headers = Header.where(show_in_nav: true)
  end
end
