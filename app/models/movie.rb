class Movie < ApplicationRecord
  has_one_attached :image
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

  attr_accessor :remove_image
  after_save :purge_image

  def self.search(search, movie_type)
    if (search)
      if movie_type
        @movies = self.where("LOWER(title) like ? and movie_type = #{movie_type}", "%#{search.downcase}%" )
      else
        @movies = self.where("LOWER(title) like ?", "%#{search.downcase}%" )
      end
    else
      @movies = Movie.all
    end
  end

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

  def update_ranking
    ranked_mymovies = self.get_mymovies_status_watched
    number_of_mymovies = ranked_mymovies.size
    total_ranking_points = self.get_total_ranking_points ranked_mymovies
    new_ranking = self.calculate_new_ranking number_of_mymovies, total_ranking_points
    self.update(ranking_avg: new_ranking)
  end

  def get_mymovies_status_watched
    # get all ranked mymovies of this movie
    self.mymovies.where.not(ranking: nil)
  end

  def get_total_ranking_points (ranked_mymovies)
    # calculate new ranking of the movie
    total_ranking_points = 0
    ranked_mymovies.each do |movie|
      if movie.ranking
        total_ranking_points += movie.ranking
      end
    end
    total_ranking_points
  end

  def calculate_new_ranking (number_of_mymovies, total_ranking_points)
    if number_of_mymovies > 0
      total_ranking_points.to_f / number_of_mymovies.to_f
    else
      nil
    end
  end

  private def purge_image
    if  self.remove_image == "1"
      image.purge_later
    end
  end

end
