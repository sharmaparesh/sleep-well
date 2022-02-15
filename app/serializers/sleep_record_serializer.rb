class SleepRecordSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :completed_at, :sleep_length
end
