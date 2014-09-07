class MatchesController < ApplicationController
  before_action :signed_in?

  def index
    match_ids = Match.where("user_id = #{current_user.id} OR match_id = #{current_user.id}")
    match_ids = match_ids.map do |m|
      if m.user_confirm == true && m.match_confirm == true
        m
      end
    end
    @matches = {}
    if match_ids.include?(nil) == false
      match_ids.each do |m|
        User.all.each do |u|
          if m.match_id == u.id
            @matches[m.id] = u
          end
        end
      end
    end

    people_interested_in_you = Match.where("match_id = #{current_user.id} AND user_confirm = true AND match_confirm = false")
    @piy = []
    people_interested_in_you.each do |p|
      User.all.each do |u|
        if p.user_id == u.id
          @piy << u
        end
      end
    end
  end

  def match_request
    Match.create({
      user_id: current_user.id,
      match_id: params[:match_id],
      user_confirm: true,
      match_confirm: false
      })
    respond_to do |f|
      f.json { render json: {msg: "Well let them know!"}}
    end
  end

  def match_confirm

  end

end