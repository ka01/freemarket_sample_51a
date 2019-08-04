class ApplicationController < ActionController::Base
  before_action :basic_auth

  private
  # Basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'frema51a' && password == '9074'
    end
  end
end
