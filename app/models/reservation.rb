class Reservation < ActiveRecord::Base
  STATUS_LIST = [
    DEMAND   = 1, # 希望
    APPROVED = 2, # 承認
    DENIED   = 3, # 拒否
  ]
end
