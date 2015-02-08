class Parking < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_many :allow_times
  has_many :deny_dates
  belongs_to :user
  geocoded_by :address
  after_validation :geocode

  accepts_nested_attributes_for :allow_times, :deny_dates,
                                reject_if: :all_blank, allow_destroy: true

  validates :name, :memo, presence: true

  scope :owned, ->(user) { where(user_id: user) }

  # AllowTimeに「予約希望の曜日」と「予約希望の時間」がマッチする
  # DenyDateに「予約希望の日付」がマッチしない
  # 「予約希望の時間」に、だれも予約を入れていない駐車場
  def self.search(demand_weekday, demand_date, demand_time_from, demand_time_to)
    record = self.joins(:allow_times, :deny_dates)
    record = record.merge(AllowTime.where(weekday: demand_weekday)) if demand_weekday.present?
    record = record.merge(AllowTime.where(["start_time < ?", demand_time_from])) if demand_time_from.present?
    record = record.merge(AllowTime.where(["end_time > ?", demand_time_to])) if demand_time_to.present?
    record = record.merge(DenyDate.where.not(date: demand_date)) if demand_date.present?

    return record
  end
end
