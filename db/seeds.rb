email = "test@example.com"
password = "password"

ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")

user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

post1 = user2.foods.create!(name: "沖縄そば")
post2 = user1.foods.create!(name: "海ぶどう")
post3 = user3.foods.create!(name: "ゴーヤーチャンプルー")
post4 = user3.foods.create!(name: "サーターアンダギー")
post5 = user1.foods.create!(name: "タコライス")

post1.likes.create!(user_id: user1.id)
post1.likes.create!(user_id: user3.id)
post2.likes.create!(user_id: user2.id)
post3.likes.create!(user_id: user1.id)
post4.likes.create!(user_id: user1.id)
post4.likes.create!(user_id: user2.id)
post5.likes.create!(user_id: user3.id)

User.create!(email: email, password: password)

puts "初期データの投入に成功しました！"
