class User < ActiveRecord::Base
  has_secure_password

  before_validation :downcase_email
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true, length: {in: 2..20}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  private
  def downcase_email
    self.email = email.downcase if email.present?
  end
end
