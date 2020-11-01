class RemoveRankingAvgFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :ranking_avg, :decimal
  end
end
