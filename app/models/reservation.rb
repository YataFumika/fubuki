class Reservation < ActiveRecord::Base
  STATUS_LIST = [
    DEMAND   = { code: 1, label: "希望" }, # 希望
    APPROVED = { code: 2, label: "承認" }, # 承認
    DENIED   = { code: 3, label: "拒否" }, # 拒否
  ]

  belongs_to :user
  belongs_to :parking

  validates :start_at, :end_at, :status, presence: true

  # 借りる予定（Reservation.user = login_user）
  scope :rent, ->(login_user) { where(user_id: login_user) }

  # 貸す予定（Reservation.parking.user = login_user
  scope :lend, ->(login_user) { where(parking_id: login_user.try(:parkings)) }
end
