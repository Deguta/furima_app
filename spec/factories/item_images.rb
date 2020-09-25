FactoryBot.define do
  factory :item_image do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/sample.jpeg')) }
    association :item
  end
end
