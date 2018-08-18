class HabitShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_date, :daily_check_in, :twenty_one_check_ins, :additional_check_ins

  def description
    object.body
  end

  def check_ins
    day_number = 0
    object.check_ins.order(:id).map do |check_in|
      day_number += 1
      { id: check_in.id, complete: check_in.complete, check_in_date: check_in.check_in_date, day_number: day_number }
    end
  end

  def twenty_one_check_ins
    check_ins[0..20]
  end

  def additional_check_ins
    check_ins[21..89]
  end
end
