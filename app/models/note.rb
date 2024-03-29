# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  body       :text             not null
#  user_id    :integer          not null
#  track_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Note < ActiveRecord::Base
  validates :title, :body, :user_id, :track_id, presence: true
  
  belongs_to :user
  belongs_to :track
end
