class AllowTime < ActiveRecord::Base
  WEEKDAY_LIST = [
    MON = { code: 1, label: "月" },
    TUE = { code: 2, label: "火" },
    WED = { code: 3, label: "水" },
    THU = { code: 4, label: "木" },
    FRI = { code: 5, label: "金" },
    SAT = { code: 6, label: "土" },
    SUN = { code: 7, label: "日" },
  ]

  has_many :parkings

  validates :weekday, :start_time, :end_time, presence: true
end
