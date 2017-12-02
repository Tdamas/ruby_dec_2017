class User < ApplicationRecord
  has_many :friendships, foreign_key: "user_id", class_name: "Friendship"
  has_many :friends, through: :friendships
end

# # Create Users
# User.create(first_name: "John", last_name: "Doe")
# User.create(first_name: "Jane", last_name: "Smith")
# User.create(first_name: "Michael", last_name: "Harris")
# User.create(first_name: "Lisa", last_name: "Johnson")
# User.create(first_name: "Ben", last_name: "Thompson")
#
# # Create Friendships
# Friendship.create(user: User.first, friend: User.last)
# Friendship.create(user: User.first, friend: User.second)
# Friendship.create(user: User.third, friend: User.third)
# Friendship.create(user: User.third, friend: User.find(4))

# Retrieve all frinds of the first Users
User.first.friends
User.third.friends
