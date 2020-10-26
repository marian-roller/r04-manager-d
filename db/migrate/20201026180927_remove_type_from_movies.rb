class RemoveTypeFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :type, :integer, limit: 2
  end
end
