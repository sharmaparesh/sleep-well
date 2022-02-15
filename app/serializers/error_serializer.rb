class ErrorSerializer < ActiveModel::Serializer
  attributes :error, :links

  def error
    {
      message: object[:message],
      code: object[:code]
    }
  end

  def links
    object[:links] || {}
  end
end
