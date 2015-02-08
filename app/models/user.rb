class User < ActiveRecord::Base
  has_secure_password
  has_many :parkings
  has_many :reservations
  
end
