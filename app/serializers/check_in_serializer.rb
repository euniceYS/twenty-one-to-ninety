class CheckInSerializer < ActiveModel::Serializer
  attributes :id, :complete, :updated_at, :created_at

  def updated_at
    object.updated_at.strftime("%B %d, %Y")
  end

  def created_at
    object.created_at.strftime("%B %d, %Y")
  end

end
