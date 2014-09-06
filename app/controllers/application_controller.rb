class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :signed_in?, :current_user, :picked_dislike?

  def signed_in?
    true if session[:user_id]
  end

  def current_user
    if signed_in?
      User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  def picked_dislike?
    if current_user
      true if current_user.dislike != nil
    else
      redirect_to root_path
    end
  end
end
