class Parking < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_many :allow_times
  has_many :deny_dates
  belongs_to :user

  validates :name, :memo, presence: true
end
