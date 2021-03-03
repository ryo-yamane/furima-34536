class OrderPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :consignor_area_id, :city_town, :number, :building_name, :phone_number, :order, :user_id,
                :product_id, :token

  with_options presence: true do
    validates :post_code,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :consignor_area_id, numericality: { other_than: 1 }
    validates :city_town
    validates :number
    validates :phone_number, length: { maximum: 11 }
    validates :user_id
    validates :product_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Purchase.create(post_code: post_code, consignor_area_id: consignor_area_id, city_town: city_town, number: number,
                               building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
