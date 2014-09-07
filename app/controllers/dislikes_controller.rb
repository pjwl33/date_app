class DislikesController < ApplicationController
  before_action :signed_in?

  def new
    @dislikes = todays_dislikes
    @dislike = Dislike.new
  end

  def todays_dislikes
    if Rails.cache.fetch('todays_dislikes') == nil
      dls = Dislike.all.sample(5)
      Rails.cache.write('todays_dislikes', dls, expires_in: 24.hours)
    else
      Rails.cache.fetch('todays_dislikes')
    end
  end

  def create
    all_dislikes = params.keys
    omit_params = ["utf8", "authenticity_token", "commit", "controller", "action"]
    # binding.pry
    all_dislikes.each do |type|
      current_user.dislikes.create(name: type) unless omit_params.include?(type)
    end
    redirect_to root_path
  end

  private


end