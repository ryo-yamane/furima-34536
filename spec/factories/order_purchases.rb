FactoryBot.define do
  factory :order_purchase do
    token { 'pk_test_582d7c7ujrhsl36748lll9c' }
    post_code { '123-1234'}
    consignor_area_id { 2 }
    city_town { '大阪市' }
    number { '1-1' }
    building_name { '桜マンション' }
    phone_number { '09011111111' }
  end
end
