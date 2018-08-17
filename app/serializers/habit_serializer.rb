class HabitSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_date, :daily_check_in
end
