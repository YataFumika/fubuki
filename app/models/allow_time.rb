class AllowTime < ActiveRecord::Base
  has_many :parkings

  validates :weekday, :start_time, :end_time, presence: true
end
