class Dojo < ActiveRecord::Base
  has_many :ninjas, dependent: :destroy
  validates :name, :city, :state, presence: true
  validates :state, length: { is: 2 }
end

# 8. How would you only retrieve the first_name of the ninja that belongs to the second dojo and order the result by created_at DESC order?
# Ninja.where(dojo: Dojo.second).select(:id, :first_name).order(created_at: :desc)

# 7. Make sure you understand how to get all of the ninjas for any dojo (e.g. get all the ninjas for the first dojo, second dojo, etc)
# Dojo.first.ninjas
# Dojo.second.ninjas
# Dojo.third.ninjas
