# User.create!(
#   email: 'test@test.com',
#   name: 'テスト太郎',
#   provider: 'aaaa',
#   uid: "aaa",
#   password: 'hogehoge'
# )

Event.create!(
  owner_id: '167',
  name: 'hoge',
  place: 'fuga',
  start_time: 'Thu, 12 Aug 2021 08:00:00 JST +09:00',
  end_time:  'Thu, 12 Aug 2021 17:30:00 JST +09:00',
  content: 'hogehoge'
)