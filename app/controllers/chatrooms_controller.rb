class ChatroomsController < ApplicationController
  before_action :signed_in?

  def start_chatting
    chatroom = Chatroom.find_or_create_by(matches_id: params[:match_id])
    respond_to do |f|
      f.json {render json: chatroom}
    end
  end

  def show
    chatroom = Chatroom.find(params[:id])
    match = Match.find(chatroom.matches_id)
    @user = current_user
    their_id = current_user.id == match.user_id ? match.match_id : match.user_id
    @match = User.find(their_id)
  end
end