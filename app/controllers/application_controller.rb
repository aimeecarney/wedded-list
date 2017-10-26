class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :except => [:home, :sign_up, :sign_in]

  private
  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
