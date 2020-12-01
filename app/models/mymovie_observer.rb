class MymovieObserver < ActiveRecord::Observer

  def after_commit(mymovie)
    # action triggered to keep movie ranking updated
    movie = Movie.find(mymovie.movie_id)
    movie.update_ranking
  end
end
