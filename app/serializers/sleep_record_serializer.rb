class SleepRecordSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at, :completed_at, :sleep_length
end
