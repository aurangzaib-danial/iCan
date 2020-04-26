class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    User.new(session[:id])
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_path
  end

end
