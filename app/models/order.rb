class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  belongs_to :product
  has_one :purchase
  #validates :token, presence: true
end
