class UpdateCheckInDate < ActiveRecord::Migration[5.2]
  def change
    change_column_null :check_ins, :check_in_date, false
    change_column_default :check_ins, :check_in_date, nil
  end
end
