class UsersController < ApplicationController
  before_action :current_user

  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user.id)
  end

end