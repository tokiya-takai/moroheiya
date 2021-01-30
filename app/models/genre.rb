class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '画像'},
    { id: 3, name: '動画'}
  ]
  include ActiveHash::Associations
  has_many :contests
end
