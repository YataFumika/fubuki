# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
u1 = User.create(name: "test1", point: 100, email: "test1@test.com", password: "test", password_confirmation: "test")
u2 = User.create(name: "test2", point: 100, email: "test2@test.com", password: "test", password_confirmation: "test")
u3 = User.create(name: "test3", point: 100, email: "test3@test.com", password: "test", password_confirmation: "test")

Parking.destroy_all
p1 = Parking.create(
  address: "島根県松江市123-1",
  name: "駐車場１",
  user_id: u1.id,
  memo: "101が該当の駐車場です。",
)

p2 = Parking.create(
  address: "島根県松江市456-1",
  name: "駐車場２",
  user_id: u2.id,
  memo: "よろしくお願いします。",
)

p3 = Parking.create(
  address: "島根県松江市789-1",
  name: "駐車場３",
  user_id: u3.id,
  memo: "よろしくお願いします。",
)

AllowTime.destroy_all
AllowTime.create(
  parking_id: p1.id,
  weekday: 1,
  start_time: "1000",
  end_time: "1800"
)

AllowTime.create(
  parking_id: p1.id,
  weekday: 2,
  start_time: "1000",
  end_time: "1800"
)

AllowTime.create(
  parking_id: p1.id,
  weekday: 3,
  start_time: "1000",
  end_time: "1800"
)

AllowTime.create(
  parking_id: p1.id,
  weekday: 4,
  start_time: "1000",
  end_time: "1800"
)

AllowTime.create(
  parking_id: p1.id,
  weekday: 5,
  start_time: "1000",
  end_time: "1800"
)

AllowTime.create(
  parking_id: p1.id,
  weekday: 6,
  start_time: "1000",
  end_time: "1800"
)

AllowTime.create(
  parking_id: p1.id,
  weekday: 7,
  start_time: "1000",
  end_time: "1800"
)

AllowTime.create(
  parking_id: p2.id,
  weekday: 1,
  start_time: "1000",
  end_time: "1800"
)

AllowTime.create(
  parking_id: p2.id,
  weekday: 3,
  start_time: "1000",
  end_time: "1800"
)

AllowTime.create(
  parking_id: p2.id,
  weekday: 5,
  start_time: "1000",
  end_time: "1800"
)

AllowTime.create(
  parking_id: p2.id,
  weekday: 7,
  start_time: "1000",
  end_time: "1800"
)

AllowTime.create(
  parking_id: p3.id,
  weekday: 1,
  start_time: "1000",
  end_time: "1800"
)

DenyDate.destroy_all

DenyDate.create(
  parking_id: p1.id,
  date: Date.new(2015, 2 , 9)
)

DenyDate.create(
  parking_id: p1.id,
  date: Date.new(2015, 2 , 10)
)

DenyDate.create(
  parking_id: p2.id,
  date: Date.new(2015, 2 , 9)
)


