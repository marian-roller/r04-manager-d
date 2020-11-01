class AddUserFieldsToMovies < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :added_by, foreign_key: { to_table: :users }
    add_reference :movies, :updated_by, foreign_key: { to_table: :users }
  end
end
