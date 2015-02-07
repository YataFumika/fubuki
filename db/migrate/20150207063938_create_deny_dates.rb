class CreateDenyDates < ActiveRecord::Migration
  def change
    create_table :deny_dates do |t|
      t.integer :parking_id
      t.date :date

      t.timestamps
    end
  end
end
