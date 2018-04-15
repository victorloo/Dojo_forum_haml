class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authenticate_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Not Allow!"
    end
  end
end
