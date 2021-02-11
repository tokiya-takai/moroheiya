FactoryBot.define do
  factory :contest do
    title         {Faker::Lorem.sentence}
    genre_id      {2}
    category_id   {2}
    content       {Faker::Lorem.sentence}
    deadline      {DateTime.now + Rational(1, 24)}
    general       {true}
    association :user

    after(:build) do |contest|
      contest.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
