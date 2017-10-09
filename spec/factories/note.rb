FactoryGirl.define do
  factory :note do
    association :user
    sequence(:title) { |n| "Note #{n}" }
    date Date.new(2017, 7, 25)
    content "Yes, I really love writing notes! Pig porchetta shoulder venison, ham pork chop turkey."
  end
end
