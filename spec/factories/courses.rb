FactoryBot.define do
  factory :course do
    sequence(:name) { |n| "course_#{n}" }

    coach
  end

  trait :self_assignable_true do
    self_assignable { true }
  end

  trait :self_assignable_false do
    self_assignable { false }
  end
end
