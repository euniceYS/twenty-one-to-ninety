class HabitSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_date, :daily_check_in

  def daily_check_in
    check_ins = object.check_ins
    unless check_ins.empty?
      check_ins.each do |today|
        if today["check_in_date"] == Date.today
          return today.as_json(only: [:id, :complete, :check_in_date])
        end
      end
    end
  end
end
