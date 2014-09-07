class DislikesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :signed_in?, only: [:new]

  def new
    @dislike = Dislike.new
    @dislikes = todays_dislikes
  end

  def todays_dislikes
    if Rails.cache.fetch('todays_dislikes')
      Rails.cache.fetch('todays_dislikes')
    else
      dls = Dislike.all.sample(5)
      Rails.cache.write('todays_dislikes', dls, expires_in: 24.hours)
      Rails.cache.fetch('todays_dislikes')
    end
  end

  def create
    user = User.find(current_user.id)
    user.dislikes_id = params["hate-pick"].to_i
    if params["gender-pick"]
      user.gender_interest = User.check_gender(params["gender-pick"])
    end
    user.save
    redirect_to users_path
  end

end