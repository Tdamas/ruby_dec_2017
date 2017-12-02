class Message < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :author, :messages, presence: true, length: { minimum: 3 }
end
