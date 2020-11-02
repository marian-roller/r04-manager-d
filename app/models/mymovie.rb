class Mymovie < ApplicationRecord
  belongs_to :movie
  belongs_to :user
end
