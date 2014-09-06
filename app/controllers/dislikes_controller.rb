class DislikesController < ApplicationController
  before_action :current_user

  def index
    @dislikes = Dislike.all.sample(5)
  end

  def new
    @dislike = Dislike.new
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