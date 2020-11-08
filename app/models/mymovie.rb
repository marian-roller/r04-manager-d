class Mymovie < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_rich_text :impression
end
