# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
i = 1
5.times do
  User.create!(
    name: "barista#{i}",
    sex: '男',
    birthday: '1997-10-19',
    email: "barista#{i}@example.com",
    password: 'password'
  )
  i += 1
end

5.times do
  User.create!(
    name: "barista#{i}",
    sex: '女',
    birthday: '1997-10-19',
    email: "barista#{i}@example.com",
    password: 'password'
  )
  i += 1
end

n = 1
10.times do
  Owner.create!(
    company: "company#{n}",
    name: "owner#{n}",
    tel: '11-1111',
    email: "owner#{n}@example.com",
    password: 'password'
  )
end