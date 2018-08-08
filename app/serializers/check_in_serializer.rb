class CheckInSerializer < ActiveModel::Serializer
  attributes :id, :complete, :updated_at, :habit_title, :habit_id

  def updated_at
    object.updated_at.strftime("%B %d, %Y")
  end

  def habit_title
    habit_id = object.habit_id
    habit = Habit.find(habit_id)
    habit.title
  end
end
