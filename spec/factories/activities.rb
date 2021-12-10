FactoryBot.define do
  factory :activity do
    sequence(:name) { |n| "activity_#{n}" }
    course
  end
end
