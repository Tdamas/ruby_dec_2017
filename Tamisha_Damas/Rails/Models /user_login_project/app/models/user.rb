class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :age, :email_address, presence: true
  validates :first_name, :last_name, length: { minimum: 2}
  validates :age, numericality: { greater_than_or_equal_to: 10, less_than: 150 }
end
