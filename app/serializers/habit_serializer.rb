class HabitSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_date, :user_id, :user_fullname

  def description
    object.body
  end

  def start_date
    object.start_date.strftime("%B %d, %Y")
  end

  def user_fullname
    user_id = object.user_id
    user = User.find(user_id)
    user.first_name + ' ' + user.last_name
  end
end
