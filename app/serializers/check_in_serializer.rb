class CheckInSerializer < ActiveModel::Serializer
  attributes :id, :complete, :check_in_date 
end
