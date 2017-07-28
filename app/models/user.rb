class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_secure_password

  before_save { self.email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true,
                       confirmation: true,
                       length: { within: 6..20 }

end
