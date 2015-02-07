class DenyDate < ActiveRecord::Base
  has_many :parkings

  validates :date, presence: true
end
