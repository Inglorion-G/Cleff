class Note < ActiveRecord::Base
  validates :title, :body, :user_id, :track_id, presence: true
  
end
