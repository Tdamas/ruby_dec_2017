class User < ActiveRecord::Base
  has_many :owners
  has_many :posts
  has_many :messages
  has_many :comments, as: :commentable

  # all the blogs owned by a specific user
  has_many :blogs, through: :owners
  # all the blogs a user has posted on
  has_many :blogs_post, through: :post, source: :blog

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
