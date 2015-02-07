class AddPhotoToParking < ActiveRecord::Migration
  def change
    add_column :parkings, :photo, :string
  end
end
