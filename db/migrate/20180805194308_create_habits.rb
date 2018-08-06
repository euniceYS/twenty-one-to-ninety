class CreateHabits < ActiveRecord::Migration[5.2]
  def change
    create_table :habits do |t|
      t.string :title, null: false
      t.string :body
      t.date :start_date, default: Time.now

      t.belongs_to :user
      t.timestamps
    end
  end
end
