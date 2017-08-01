FactoryGirl.define do
  factory :note do
    user_id 1
    sequence(:title) { |n| "Note #{n}" }
    date Date.new(2017, 7, 25)
    content "Yes, I really love writing notes! Pig porchetta shoulder venison, ham pork chop turkey. Doner ribeye venison, jerky spare ribs brisket pork chop porchetta"
  end
end
