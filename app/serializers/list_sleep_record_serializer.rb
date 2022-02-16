class ListSleepRecordSerializer < ActiveModel::Serializer
  attributes :sleep_records, :pagination, :links

  def sleep_records
    ActiveModelSerializers::SerializableResource.new(
      object[:sleep_records], each_serializer: SleepRecordSerializer
    )
  end

  def pagination
    object[:pagination] || {}
  end

  def links
    object[:links] || {}
  end
end

