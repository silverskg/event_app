# User.create!(
#   email: 'test@test.com',
#   name: 'テスト太郎',
#   provider: 'aaaa',
#   uid: "aaa",
#   password: 'hogehoge'
# )

# Event.create!(
#   owner_id: '167',
#   name: 'hoge',
#   place: 'fuga',
#   start_time: 'Thu, 12 Aug 2021 08:00:00 JST +09:00',
#   end_time:  'Thu, 12 Aug 2021 17:30:00 JST +09:00',
#   content: 'hogehoge'
# )


# User.create!(name:  "Example User",
#   email: "example@railstutorial.org",
#   uid: "1",
#   password:              "foobar",
#   password_confirmation: "foobar")

99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
uid ="#{n+1}"
password = "password"
User.create!(name:  name,
    email: email,
    uid: uid,
    password:              password,
    password_confirmation: password)
end