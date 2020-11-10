class Mymovie < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_rich_text :impression
  validates :movie_id, presence: true
  validates_uniqueness_of :movie_id, scope: :user_id, message: 'already chosen'
  validates :urgent, inclusion: { in: [false, true] }
  validates :times_watched, numericality: { only_integer: true, less_than: 100}, allow_blank: true
  validates :ranking, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10}, allow_blank: true
  validates :watching_season, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100}, allow_blank: true
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

end
