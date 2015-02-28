FactoryGirl.define do
  factory :device do
    name      "Dishwasher"
    reference "dw"
    strategy  :onetime
  end
end
