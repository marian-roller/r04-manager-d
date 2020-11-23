class Mymovie < ApplicationRecord
  default_scope { order('updated_at DESC') }
  belongs_to :movie
  belongs_to :user
  has_rich_text :impression
  validates :movie_id, presence: true
  validates_uniqueness_of :movie_id, scope: :user_id, message: 'already chosen'
  validates :urgent, inclusion: { in: [false, true] }, allow_blank: true
  validates :times_watched, numericality: { only_integer: true, less_than: 100}, allow_blank: true
  validates :ranking, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10}, allow_blank: true
  validates :watching_season, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, allow_blank: true
  validates :last_episode, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000}, allow_blank: true

  validate :watching_start_date_scope
  validate :watching_end_date_scope

  def watching_start_date_scope
    if watching_start.present? && watching_start < Date.parse('01-01-2015')
      errors.add(:watching_start, "too log time ago")
    end
    if watching_start.present? && watching_start > Date.parse('31-12-2030')
      errors.add(:watching_start, "too much in the future")
    end
  end

  def watching_end_date_scope
    if watching_end.present? && watching_end < Date.parse('01-01-2015')
      errors.add(:watching_end, "too log time ago")
    end
    if watching_end.present? && watching_end > Date.parse('31-12-2030')
      errors.add(:watching_end, "too much in the future")
    end
  end

  before_create do
    if self.movie.movie_type == 2
      self.watching_season = 0
      self.last_episode = 0
    end
  end

  def update_episode_season_status

    # my movie params for updating
    status = self.status
    current_season_no = self.watching_season
    current_episode_no = self.last_episode

    # seasons data for comparisons
    current_season_object = self.movie.seasons.where(season_no: current_season_no).first
    current_season_object_episodes = current_season_object.episodes
    total_seasons = self.movie.seasons.size

    # regular update
    if current_episode_no < current_season_object_episodes - 1
      episode = self.last_episode + 1
    end

    # last episode in season update
    if current_episode_no == current_season_object_episodes - 1
      if current_season_no == total_seasons
        # last episode in last season update
        episode = self.last_episode + 1
        status = 3
      else
        current_season_no += 1
        episode = 0
      end
    end

    data = {
        "status" => status,
        "watching_season"=> current_season_no,
        "last_episode"=> episode
    }
  end

  def get_current_season_episodes
    current_season_no = self.watching_season
    current_season_object = self.movie.seasons.where(season_no: current_season_no).first
    current_season_object_episodes = current_season_object.episodes
  end
end
