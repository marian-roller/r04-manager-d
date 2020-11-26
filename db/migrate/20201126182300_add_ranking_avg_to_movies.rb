class AddRankingAvgToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :ranking_avg, :decimal, precision: 4, scale: 2
  end
end
