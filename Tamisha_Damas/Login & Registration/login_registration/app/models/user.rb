class User < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = /\A\S+@.+\.\S+\z/
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
