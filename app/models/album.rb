class Album < ActiveRecord::Base
  validates :name, :band_id, presence: true
  validates :recording_type, presence: true, inclusion: { in: %w(studio, live) }
  
  belongs_to :band
  has_many :tracks, dependent: :destroy
end
