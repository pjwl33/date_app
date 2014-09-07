class UsersController < ApplicationController
  before_action :signed_in?

  def index
    if current_user.dislikes_id == nil
      redirect_to dislikes_new_path
    else
      todays_hate_id = current_user.dislikes_id
      users_interest = current_user.gender_interest
      @users = User.where("dislikes_id = #{todays_hate_id} AND gender = #{users_interest}")
      binding.pry
    end
  end

  def show
    @user = User.find(current_user.id)
    @dislike = Dislike.find(current_user.dislikes_id)
  end

end