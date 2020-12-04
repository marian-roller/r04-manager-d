# frozen_string_literal: true

class MymovieStatusReflex < ApplicationReflex
  delegate :current_user, to: :connection

  def start_watching
    mymovie = Mymovie.find(element.dataset[:mymovie_id])
    if mymovie.movie.movie_type == 2
      mymovie.update(status: 2, watching_season: 1, last_episode: 0)
    else
      mymovie.update(status: 2)
    end
  end

  def restart_watching
    mymovie = Mymovie.find(element.dataset[:mymovie_id])
    mymovie.update(status: 2)
  end

  def drop_watching
    mymovie = Mymovie.find(element.dataset[:mymovie_id])
    mymovie.update(status: 4)
  end

  # inactive method
  def update_episodes_form
    @mymovie = current_user.mymovies.find(mymovie_params[:id])
    episode =  @mymovie.last_episode += 1
    @mymovie.update(last_episode: episode)
  end

  def update_episodes_link
    mymovie = Mymovie.find(element.dataset[:mymovie_id])
    updated_params = mymovie.update_episode_season_status
    mymovie.update(updated_params)
  end

  def mark_as_watched
    mymovie = Mymovie.find(element.dataset[:mymovie_id])
    now = Time.now.strftime("%d-%m-%Y")
    mymovie.update(status: 3, watching_start: now)
  end

  def urgent
    mymovie = Mymovie.find(element.dataset[:mymovie_id])
    mymovie.update(urgent: true)
  end

  def noturgent
    mymovie = Mymovie.find(element.dataset[:mymovie_id])
    mymovie.update(urgent: false)
  end

  private

  def set_mymovie
    # @mymovie = current_user.mymovies.find(params[:id])
    # @mymovies = true
  end

  # Only allow a trusted parameter "white list" through.
  def mymovie_params
    params.require(:mymovie).permit(:id, :movie_id, :user_id, :impression, :status, :urgent, :watching_start, :watching_end, :times_watched, :ranking, :watching_season, :last_episode)
  end

end
