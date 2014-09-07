class DislikesController < ApplicationController
  before_action :signed_in?

  def new
    @dislikes = todays_dislikes
    @dislike = Dislike.new
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
    current_user.dislike_id = params[:dislike_id]
    current_user.save!
  end

  private


end