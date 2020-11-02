class Movie < ApplicationRecord
  validates :title, :movie_type, presence: true

  belongs_to :added_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'
  has_many :mymovies
end
