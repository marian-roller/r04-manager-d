class CreateMymovies < ActiveRecord::Migration[6.0]
  def change
    create_table :mymovies do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :impression
      t.integer :status, limit: 2
      t.boolean :urgent
      t.timestamp :watching_start
      t.timestamp :watching_end
      t.integer :times_watched, limit: 2
      t.integer :ranking, limit: 2
      t.integer :watching_season, limit: 2
      t.integer :last_episode, limit: 2

      t.timestamps
    end
  end
end
