FactoryBot.define do
  factory :list do
    board
    title { Faker::Lorem.word }
    class_list { Faker::Lorem.word}
  end
end
