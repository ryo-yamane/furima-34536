class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :consignor_area
  belongs_to :deliver_fee
  belongs_to :prepare_date

  belongs_to :user
  has_one_attached :image



  validates :product_name,      presence: true
  validates :product_explain,   presence: true
  validates :price,             presence: true, numericality: {greater_than_or_equal_to: 300,less_than: 100000000 }
  validates :category_id,       numericality: { other_than: 1 }
  validates :condition_id,      numericality: { other_than: 1 }
  validates :consignor_area_id, numericality: { other_than: 1 }
  validates :deliver_fee_id,    numericality: { other_than: 1 }
  validates :prepare_date_id,   numericality: { other_than: 1 }
end
