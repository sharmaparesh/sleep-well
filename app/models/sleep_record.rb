class SleepRecord < ApplicationRecord
  scope :initialized, -> { where(status: Constants::SleepRecordStatus::INITIALIZED) }

  belongs_to :user

  def completed?
    status == Constants::SleepRecordStatus::COMPLETED
  end

  def initialized
    status == Constants::SleepRecordStatus::INITIALIZED
  end

  def sleep_length
    return unless completed?

    completed_at - created_at
  end
end
