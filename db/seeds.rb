# frozen_string_literal: true

# メインのサンプルユーザーを1人作成する
User.create!(name: 'Admin User',
             email: 'admin@example.com',
             password: 'adminpassword',
             password_confirmation: 'adminpassword',
             admin: true)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@example.com"
  password = 'password'
  User.create!(name:,
               email:,
               password:,
               password_confirmation: password)
end
