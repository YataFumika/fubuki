class Reservation < ActiveRecord::Base
  STATUS_LIST = [
    DEMAND   = { code: 1, label: "希望" },
    APPROVED = { code: 2, label: "承認" },
    DENIED   = { code: 3, label: "拒否" },
  ]

  DESP_TYPE_LIST = [
    DESP_RENT     = { code: 0, label: "あなたが貸してもらう貸駐車" },
    DESP_DEMAND   = { code: 1, label: "あなたが貸す貸駐車(未承認)" },
    DESP_APPROVED = { code: 2, label: "あなたが貸す貸駐車(承認済み)" },
    DESP_DENIED   = { code: 3, label: "貸し出しを拒否した貸駐車" },
  ]

  belongs_to :user
  belongs_to :parking

  validates :start_at, :end_at, :status, presence: true

  # 借りる予定（Reservation.user = login_user）
  scope :rent_from, ->(login_user) { where(user_id: login_user) }

  # 貸す予定（Reservation.parking.user = login_user
  scope :lend_to, ->(login_user) { where(parking_id: login_user.try(:parkings)) }

  scope :demand, -> { where(status: DEMAND[:code]) }
  scope :approved, -> { where(status: APPROVED[:code]) }
  scope :denied, -> { where(status: DENIED[:code]) }

  # AllowTimeに「予約希望の曜日」と「予約希望の時間」がマッチする
  # DenyDateに「予約希望の日付」がマッチしない
  # 「予約希望の時間」に、だれも予約を入れていない駐車場
  def self.search(demand_weekday, demand_weekda)
  end
end
