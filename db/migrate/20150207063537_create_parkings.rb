class CreateParkings < ActiveRecord::Migration
  def change
    create_table :parkings do |t|
      t.string :name
      t.string :address
      t.integer :user_id
      t.text :memo

      t.timestamps
    end
  end
end
