
50_000.times do
    User.create(username: Faker::Internet.unique.username)
  end
  
  50_000.times do
    Post.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user_id: rand(1..50_000))
  end
  
  20_000.times do
    Review.create(rating: rand(1..5), comment: Faker::Lorem.paragraph, user_id: rand(1..50_000), post_id: rand(1..50_000))
  end
  