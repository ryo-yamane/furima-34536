class PrepareDate < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: '1〜2日で発送'},
    { id: 3, name: '２日〜3日で発送'},
    { id: 4, name: '3日〜5日で発送'},
    { id: 5, name: '5日〜7日で発送'}
  ]

  include ActiveHash::Associations
  has_many :products

end

