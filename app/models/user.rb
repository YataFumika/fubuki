class User < ActiveRecord::Base
  has_many :parkings
  has_many :reservations
  has_secure_password
end
