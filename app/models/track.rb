# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  album_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  track_type :string(255)
#  lyrics     :text
#

class Track < ActiveRecord::Base
  validates :name, :album_id, presence: true
  validates :track_type, inclusion: { in: %w(bonus, regular) }
  
  belongs_to :album
  has_many :notes
end
