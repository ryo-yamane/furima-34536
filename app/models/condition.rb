class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: 'A:新品・未使用'},
    { id: 3, name: 'B:未使用に近い'},
    { id: 4, name: 'C:目立った傷や汚れなし'},
    { id: 5, name: 'D:やや使用感あり'},
    { id: 6, name: 'E:やや傷や汚れあり'},
    { id: 7, name: 'F:目立った傷や汚れあり'},
    { id: 8, name: 'G:全体的に状態が悪い'},
  ]

  include ActiveHash::Associations
  has_many :products

end