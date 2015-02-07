class User < ActiveRecord::Base
  has_many :parkings
  has_many :reservationsß
end
