FactoryGirl.define do

  factory :message do
    body        "Hello"
    image       "image.jpg"
    user_id     1
    group_id    2
  end

end
