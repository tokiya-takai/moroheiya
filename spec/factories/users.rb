FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials(number: 5)}
    email                   {Faker::Internet.free_email}
    password                {"qwerty123"}
    password_confirmation   {password}
    family_name             {Gimei.last.kanji}
    first_name              {Gimei.first.kanji}
    family_name_kana        {Gimei.last.katakana}
    first_name_kana         {Gimei.first.katakana}
    birthday                {"2000-01-01"}
    profile                 {Faker::Lorem.sentence}
    black_favorite          {0}
    gold_favorite           {0}
    purple_favorite         {0}
    count_first             {0}
    count_second            {0}
    count_third             {0}
  end
end
