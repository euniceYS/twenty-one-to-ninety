class CheckInSerializer < ActiveModel::Serializer
  attributes :id, :habit_id, :complete, :check_in_date

  def check_in_date
    object.check_in_date.strftime( "%^b %e")
  end
end
