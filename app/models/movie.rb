class Movie < ApplicationRecord
  validates :title, :movie_type, presence: true
end
