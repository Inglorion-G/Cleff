# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  
  before_validation :ensure_session_token
  validates :email, :password_digest, :session_token, :activated, presence: true
  validates :email, :session_token, uniqueness: true
  
  has_many :notes
  
  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    user.try(:is_password?, password) ? user : nil
  end
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end
  
  def password=(secret)
    if secret.present?
      @password = secret
      self.password_digest = BCrypt::Password.create(secret)
    end
  end
  
  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end
  
  private
  
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
  
end
