class MymovieObserver < ActiveRecord::Observer
  def after_save(mymovie)
    movie = Movie.find(mymovie.movie_id)
    movie.update(ranking_avg: mymovie.ranking)
  end
end
