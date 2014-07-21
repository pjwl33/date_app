class MatchesController < ApplicationController
  def create
    @match = current_user.matches.create(match_id: params[:match_id])
    if @match.save
      flash[:notice] = "We'll let them know!"
      redirect_to root_path
    else
      flash[:error] = "Unable to add Match"
      redirect_to root_path
    end
  end

  def destroy
    @match = current_user.matches.find(params[:id])
    @match.destroy
    flash[:notice] = "We'll let them know..."
    redirect_to root_path
  end

end