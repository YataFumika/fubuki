class AddLogitudeToUser < ActiveRecord::Migration
  def change
    add_column :users, :logitude, :string
  end
end
