FactoryGirl.define do
  factory :note do
    user_id 1
    title "Hey hey hey! Have good time!"
    date Date.new(2017, 7, 25)
    content "Yes, I really love this framework!!! It's absolutely fantastic! <3 Spicy jalapeno bacon ipsum dolor amet beef swine ball tip, salami ham hock fatback tri-tip t-bone meatloaf shankle landjaeger prosciutto ribeye chuck. Pastrami short loin rump burgdoggen prosciutto shoulder doner, cupim porchetta strip steak chicken shank hamburger. Pig porchetta shoulder venison, ham pork chop turkey. Doner ribeye venison, jerky spare ribs brisket pork chop porchetta"
  end
end
