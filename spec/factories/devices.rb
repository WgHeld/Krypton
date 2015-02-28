FactoryGirl.define do
  factory :device do
    name      "Dishwasher"
    reference "dw"
    strategy  :onetime

    trait :with_running_task do
      after(:create) do |device, evaluator|
        create(:task, :device => device)
      end
    end
  end
end