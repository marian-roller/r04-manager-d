# frozen_string_literal: true

class MymovieReflex < ApplicationReflex
  delegate :current_user, to: :connection

  def create_mymovie
    @mymovie = current_user.mymovies.build(movie_id: element.dataset[:movie_id], status: 1)
    @mymovie.save
  end

  def episodes
    if element.dataset[:mymovie_id]
      @mymovie = Mymovie.find(element.dataset[:mymovie_id])
      @mymovie.update(watching_season: mymovie_params[:watching_season])
    end
  end

  private
  def mymovie_params
    # params.require(:mymovie).permit(:id, :movie_id, :user_id, :impression, :status, :urgent, :watching_start, :watching_end, :times_watched, :ranking, :watching_season, :last_episode)
    #
    # może jeszcze okroić
    params.require(:mymovie).permit(:id, :movie_id, :watching_season, :last_episode)
  end
end
