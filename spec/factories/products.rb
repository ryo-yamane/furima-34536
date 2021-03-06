FactoryBot.define do
  factory :product do
    product_name      { Faker::Lorem.sentence }
    product_explain   { Faker::Lorem.sentence }
    price             { Faker::Commerce.price(range: 300..50_000, as_string: true) }
    category_id       { Faker::Number.between(from: 2, to: 5) }
    condition_id      { Faker::Number.between(from: 2, to: 5) }
    consignor_area_id { Faker::Number.between(from: 2, to: 48) }
    deliver_fee_id    { Faker::Number.between(from: 2, to: 3) }
    prepare_date_id   { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
