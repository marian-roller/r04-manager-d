class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :original_title
      t.integer :type, limit: 2, null: false
      t.text :description
      t.decimal :ranking_avg, precision: 2, scale: 1
      t.integer :year_start, limit: 2
      t.integer :year_end, limit: 2
      t.integer :duration, limit: 2

      t.timestamps
    end
  end
end
