class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category
  belongs_to :Condition
  belongs_to :Consignor_area
  belongs_to :Deliver_fee
  belongs_to :Prepare_date

  belongs_to :user
  has_one_attached :image



  validates :product_name,      presence: true
  validates :product_explain,   presence: true
  validates :price,             presence: true
  validates :category_id,       numericality: { other_than: 1 }
  validates :condition_id,      numericality: { other_than: 1 }
  validates :consignor_area_id, numericality: { other_than: 1 }
  validates :deliver_fee_id,    numericality: { other_than: 1 }
  validates :prepare_date_id,   numericality: { other_than: 1 }
end
