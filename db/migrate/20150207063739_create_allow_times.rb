class CreateAllowTimes < ActiveRecord::Migration
  def change
    create_table :allow_times do |t|
      t.integer :parking_id
      t.integer :weekday
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
