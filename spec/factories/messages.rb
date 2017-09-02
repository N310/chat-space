FactoryGirl.define do

  factory :message do
    body        Faker::Lorem.sentence
    image       Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'images', 'image.jpg'), 'image/jpg')
    user_id     Faker::Number.between(1, 100)
    group_id    Faker::Number.between(1, 100)
  end

end
