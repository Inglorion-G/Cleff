# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  name           :string(255)      not null
#  band_id        :integer          not null
#  created_at     :datetime
#  updated_at     :datetime
#  recording_type :string(255)
#

class Album < ActiveRecord::Base
  validates :name, :band_id, presence: true
  validates :recording_type, presence: true, inclusion: { in: %w(studio, live) }
  
  belongs_to :band
  has_many :tracks, dependent: :destroy
end
