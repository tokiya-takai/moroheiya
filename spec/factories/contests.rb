FactoryBot.define do
  factory :contest do
    title
    genre_id
    category_id
    content
    deadline
    general
    user
  end
end
