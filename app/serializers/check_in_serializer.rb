class CheckInSerializer < ActiveModel::Serializer
  attributes :id, :habit_id, :complete, :check_in_date
end
