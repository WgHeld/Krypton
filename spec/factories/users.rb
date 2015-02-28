FactoryGirl.define do
  factory :user do
    sequence(:name) { |i| "Heinrich#{i}" }
    reference { name.downcase }
  end

end
