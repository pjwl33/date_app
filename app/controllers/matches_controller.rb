class MatchesController < ApplicationController
  before_action :signed_in?

  def match_request
    binding.pry
    Match.create({
      user_id: current_user.id,
      match_id: params[:match_id],
      user_confirm: true,
      })
    respond_to do |f|
      f.json { render json: {msg: "Well let them know!"}}
    end
  end

  def match_request

  end

end