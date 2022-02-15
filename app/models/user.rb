class User < ApplicationRecord
  has_many :sleep_records

  def asleep?
    sleep_records.initialized.exists?
  end
end
