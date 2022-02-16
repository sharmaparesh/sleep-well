class UserFollow < ApplicationRecord
  scope :with_follower, ->(follower_id) { where(follower_id: follower_id) }

  belongs_to :user, class_name: 'User'
  belongs_to :follower, class_name: 'User'
end
