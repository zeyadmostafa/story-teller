FactoryBot.define do
    factory :review do
      rating { rand(1..5) }
      comment { Faker::Lorem.paragraph }
      user 
      post 
    end
  end
  