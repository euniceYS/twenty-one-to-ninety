class CreateCheckIns < ActiveRecord::Migration[5.2]
  def change
    create_table :check_ins do |t|
      t.boolean :complete, default: false

      t.belongs_to :habit
      t.timestamps
    end
  end
end
