class HabitSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id, :start_date, :daily_check_in

  def description
    object.body
  end

  def check_ins
    object.check_ins.as_json(only: [:id, :complete, :habit_id, :check_in_date])
  end

  def daily_check_in
    unless check_ins.empty?
      check_ins.each do |today|
        if today["check_in_date"] == Date.today
          return today
        end
      end
    end
  end

end
