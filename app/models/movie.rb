class Movie < ApplicationRecord
  belongs_to :added_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'
  has_many :mymovies, :dependent => :restrict_with_exception
  has_many :users, through: :mymovies
  has_many :seasons, :dependent => :destroy
  accepts_nested_attributes_for :seasons, allow_destroy: true
  has_rich_text :description

  validates :title, :movie_type, presence: true
  validates :title, length: { in: 2..200 }
  validates :original_title, length: { in: 2..200 }, allow_blank: true
  validates :movie_type, format: { with: /[1-2]{1}/ }
  validates :year_start, :year_end, numericality: { only_integer: true, greater_than: 1895, less_than: 2030 }, allow_blank: true
  validates :duration, numericality: { only_integer: true, greater_than: 2, less_than: 500}, allow_blank: true

  def total_episodes
    if seasons.size
      episodes = 0
      self.seasons.each do |s|
        if s.episodes
          episodes += s.episodes
        end
      end
      episodes
    end
  end
end
