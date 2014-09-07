class MatchesController < ApplicationController
  before_action :signed_in?

  def index
    match_ids = Match.where("user_id = #{current_user.id} OR match_id = #{current_user.id}")
    match_made = []
    match_ids.each do |m|
      if m.user_confirm == true && m.match_confirm == true
        match_made << m
      end
    end
    @matches = {}
    match_made.each do |m|
      User.all.each do |u|
        their_id = current_user.id == m.user_id ? m.match_id : m.user_id
        if their_id == u.id
          @matches[m.id] = u
        end
      end
    end
    # binding.pry

    people_interested_in_you = Match.where("match_id = #{current_user.id} AND user_confirm = true AND match_confirm = false")
    @piy = {}
    people_interested_in_you.each do |p|
      User.all.each do |u|
        if p.user_id == u.id
          @piy[p.id] = u
        end
      end
    end
  end

  def match_request
    Match.check_matches(current_user.id, params[:match_id].to_i)
    respond_to do |f|
      f.json { render json: {msg: "Well let them know!"}}
    end
  end

  def match_confirm

  end

end