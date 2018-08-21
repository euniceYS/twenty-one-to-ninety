class UpdateHabitStartDate < ActiveRecord::Migration[5.2]
  def change
    change_column_null :habits, :start_date, false
    change_column_default :habits, :start_date, nil
  end
end
