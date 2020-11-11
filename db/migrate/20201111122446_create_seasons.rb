class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.references :movie, null: false, foreign_key: true
      t.integer :season_no, limit: 2
      t.integer :episodes, limit: 3

      t.timestamps
    end
  end
end
