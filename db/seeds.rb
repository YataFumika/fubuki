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
Parking.create(
  address: "島根県松江市123-1",
  name: "駐車場１",
  user_id: u1.id,
  memo: "101が該当の駐車場です。",
)

Parking.create(
  address: "島根県松江市456-1",
  name: "駐車場２",
  user_id: u2.id,
  memo: "よろしくお願いします。",
)

Parking.create(
  address: "島根県松江市789-1",
  name: "駐車場３",
  user_id: u3.id,
  memo: "よろしくお願いします。",
)

