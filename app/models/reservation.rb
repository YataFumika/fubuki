class Reservation < ActiveRecord::Base
  STATUS_LIST = [
    DEMAND   = { code: 1, label: "希望" }, # 希望
    APPROVED = { code: 2, label: "承認" }, # 承認
    DENIED   = { code: 3, label: "拒否" }, # 拒否
  ]

  belongs_to :user
  belongs_to :parking

  validates :start_at, :end_at, :status, presence: true
end
