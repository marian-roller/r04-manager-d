class AddMovieTypeToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :movie_type, :integer, limit: 2
  end
end
