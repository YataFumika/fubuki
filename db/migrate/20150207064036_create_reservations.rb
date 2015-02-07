class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :parking_id
      t.datetime :start_at
      t.datetime :end_at
      t.integer :status

      t.timestamps
    end
  end
end
