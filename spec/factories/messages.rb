FactoryGirl.define do

  factory :message do
    body        "Hello"
    image       Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'images', 'image.jpg'), 'image/jpg')
    user_id     1
    group_id    2
  end

end
