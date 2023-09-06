class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '音楽' },
    { id: 3, name: '物語' },
    { id: 4, name: '写真' },
    { id: 5, name: '戦略(スポーツ)' },
    { id: 6, name: 'ゲーム攻略' },
    { id: 7, name: '企画' },
    { id: 8, name: '開発' },
    { id: 9, name: '料理' },
  ]
  include ActiveHash::Associations
  has_many :ideas
end