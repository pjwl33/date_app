class UsersController < ApplicationController
  before_action :signed_in?

  def index
    if current_user.dislikes_id == nil
      redirect_to dislikes_new_path
    else
      @dislike = Dislike.find(current_user.dislikes_id)
      @interest = current_user.men_or_women?(current_user.gender_interest)
      @users = User.where("dislikes_id = #{current_user.dislikes_id} AND gender = #{current_user.gender_interest}").shuffle
    end
  end

  def show
    @user = User.find(params[:id])
    @dislike = Dislike.find(@user.dislikes_id)
    @text = params[:id] == current_user.id ? "you" : "you both"
  end

end