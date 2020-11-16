class Season < ApplicationRecord
  default_scope { order('id ASC') }
  belongs_to :movie
end
