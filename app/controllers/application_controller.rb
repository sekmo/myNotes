class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def check_logged_in
    unless user_signed_in?
      flash[:notice] = 'Please register or login.'
      redirect_to welcome_url
    end
  end
end
