class Category < ActiveHash::Base
  self.data = [
    { id:1, name: '--' },
    { id:2, name: 'エンターテインメント' },
    { id:3, name: 'スポーツ' },
    { id:4, name: 'ファッション' },
    { id:5, name: 'アニメ・マンガ' },
    { id:6, name: 'ゲーム' },
    { id:7, name: 'ビジネス' },
    { id:8, name: 'アート・イラスト' },
    { id:9, name: '音楽' },
    { id:10, name: 'その他' },
  ]
  include ActiveHash::Associations
  has_many :contests
end
