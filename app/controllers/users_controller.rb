class UsersController < ApplicationController
  before_action :signed_in?

  def index
    @users = User.all
    redirect_to "/dislikes/new" if current_user.dislike == nil
  end

  def show
    @user = User.find(current_user.id)
  end

end