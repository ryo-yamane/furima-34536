class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  validates :product_name,      presence: true
  validates :product_explain,   presence: true
  validates :price,             presence: true
  validates :category_id,       presence: true
  validates :condition_id,      presence: true
  validates :consignor_area_id, presence: true
  validates :deliver_fee_id,    presence: true
  validates :prepare_date_id,   presence: true
end
