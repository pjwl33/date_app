require 'actionpack/action_caching'

class DislikesController < ApplicationController
  before_action :current_user
  caches_action :todays_dislikes, expires_in: 24.hour

  def new
    @dislikes = todays_dislikes
    @dislike = Dislike.new
  end

  def todays_dislikes
    Dislike.all.sample(5)
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