class Track < ActiveRecord::Base
  validates :name, :album_id, presence: true
  validates :track_type, inclusion: { in: %w(bonus, regular) }
  belongs_to :album
end
