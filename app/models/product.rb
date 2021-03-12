class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :consignor_area
  belongs_to :deliver_fee
  belongs_to :prepare_date

  belongs_to :user
  has_many_attached :images
  has_one :order

  with_options presence: true do
    validates :product_name
    validates :product_explain
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :consignor_area_id
    validates :deliver_fee_id
    validates :prepare_date_id
  end
end
