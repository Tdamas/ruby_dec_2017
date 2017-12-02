class Message < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :comments, as: :commentable

  validates :author, :message, presence: true, length: { minimum: 3 }
end
