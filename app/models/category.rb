class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'レディースファッション' },
    { id: 3, name: 'メンズファッション' },
    { id: 4, name: 'インテリア・住まい' },
    { id: 5, name: 'ベビー・キッズ' },
    { id: 6, name: '家電・スマホ・カメラ' },
    { id: 7, name: 'スポーツ・レジャー' }
  ]

  include ActiveHash::Associations
  has_many :products
end
