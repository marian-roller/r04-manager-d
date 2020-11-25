# frozen_string_literal: true

class MymovieStatusReflex < ApplicationReflex
  delegate :current_user, to: :connection
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #   - params - parameters from the element's closest form (if any)
  #
  # Example:
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com
  #

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
