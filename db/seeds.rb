# frozen_string_literal: true

# メインのサンプルユーザーを1人作成する
User.create!(name: 'Admin User',
             email: 'admin@example.com',
             password: 'adminpassword',
             password_confirmation: 'adminpassword',
             admin: true,
             confirmed_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@example.com"
  password = 'password'
  User.create!(name:,
               email:,
               password:,
               password_confirmation: password,
               confirmed_at: Time.zone.now)
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content:) }
end
