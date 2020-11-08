class Mymovie < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_rich_text :impression
  validates :movie_id, presence: true
  validates_uniqueness_of :movie_id, scope: :user_id, message: 'already chosen'
end
