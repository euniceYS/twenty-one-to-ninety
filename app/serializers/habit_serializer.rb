class HabitSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id, :user_fullname, :check_ins, :start_date

  def description
    object.body
  end

  def user_fullname
    user_id = object.user_id
    user = User.find(user_id)
    user.first_name + ' ' + user.last_name
  end

  def check_ins
    object.check_ins
  end

end
