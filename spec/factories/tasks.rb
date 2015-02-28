FactoryGirl.define do
  factory :task do
    association :device
    association :user

    after(:build) do |task|
      task.start!
    end

    trait :finished do
      after(:build) do |task|
        task.end!
      end
    end
  end
end
