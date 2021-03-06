FactoryBot.define do
  factory :work do
    title       {Faker::Lorem.sentence}
    content     {Faker::Lorem.sentence}
    user_id     {nil}
    contest_id  {nil}

    after(:build) do |work|
      work.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      work.video.attach(io: File.open('public/images/test_video.mp4'), filename: 'test_video.mp4')
    end
  end
end
