class HabitShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_date, :check_ins

  def description
    object.body
  end

  def start_date
    object.start_date.strftime( "%B %e, %Y" )
  end

  def check_ins
    object.check_ins.order(:id).as_json(only: [:id, :complete, :check_in_date])
  end

end
