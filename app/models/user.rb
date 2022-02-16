class User < ApplicationRecord
  has_many :followers, class_name: 'UserFollow'
  has_many :sleep_records

  def asleep?
    sleep_records.initialized.exists?
  end
end
