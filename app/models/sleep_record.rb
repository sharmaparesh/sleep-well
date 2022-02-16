class SleepRecord < ApplicationRecord
  scope :initialized, -> { where(status: Constants::SleepRecordStatus::INITIALIZED) }
  scope :last_seven_days, -> { where('created_at > ?', 7.days.ago.beginning_of_day) }

  belongs_to :user

  def complete
    self.status = Constants::SleepRecordStatus::COMPLETED
    self.completed_at = Time.now
  end

  def completed?
    status == Constants::SleepRecordStatus::COMPLETED
  end

  def initialized?
    status == Constants::SleepRecordStatus::INITIALIZED
  end

  def sleep_length
    return 0 unless completed?

    completed_at.to_i - created_at.to_i
  end
end
