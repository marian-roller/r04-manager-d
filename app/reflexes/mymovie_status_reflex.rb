# frozen_string_literal: true

class MymovieStatusReflex < ApplicationReflex
  delegate :current_user, to: :connection

  def initialize(channel, url: nil, element: nil, selectors: nil, method_name: nil, permanent_attribute_name: nil, params: nil)
    super
    @mymovie = Mymovie.find(element.dataset[:mymovie_id])
  end

  def start_watching
    now = Time.now.strftime("%d-%m-%Y")
    if @mymovie.movie.movie_type == 2
      @mymovie.update(status: Mymovie::STATUS_DURING, watching_season: 1, last_episode: 0, watching_start: now)
    else
      @mymovie.update(status: Mymovie::STATUS_DURING)
    end
  end

  def restart_watching
    @mymovie.update(status: Mymovie::STATUS_DURING)
  end

  def drop_watching
    now = Time.now.strftime("%d-%m-%Y")
    @mymovie.update(status: Mymovie::STATUS_DROPPED, watching_end: now)
  end

  # inactive method (originally used for form, requires allowing trusted parameters)
  def update_episodes_form
    @mymovie = current_user.mymovies.find(mymovie_params[:id])
    episode =  @mymovie.last_episode += 1
    @mymovie.update(last_episode: episode)
  end

  def update_episodes_link
    updated_params = @mymovie.update_episode_season_status
    @mymovie.update(updated_params)
  end

  def mark_as_watched
    now = Time.now.strftime("%d-%m-%Y")
    times_watched = @mymovie.update_times_watched
    @mymovie.update(status: Mymovie::STATUS_AFTER, watching_end: now, times_watched: times_watched)
  end

  def urgent
    @mymovie.update(urgent: true)
  end

  def noturgent
    @mymovie.update(urgent: false)
  end

end
