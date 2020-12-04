# frozen_string_literal: true

class MymovieReflex < ApplicationReflex
  delegate :current_user, to: :connection

  def create_mymovie
    @mymovie = current_user.mymovies.build(movie_id: element.dataset[:movie_id], status: 1)
    @mymovie.save
  end

end
