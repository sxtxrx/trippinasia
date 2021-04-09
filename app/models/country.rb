class Country < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: 'インドネシア' },
      { id: 3, name: 'カンボジア' },
      { id: 4, name: 'シンガポール' },
      { id: 5, name: 'タイ' },
      { id: 6, name: '東ティモール' },
      { id: 7, name: 'フィリピン' },
      { id: 8, name: 'ブルネイ' },
      { id: 9, name: 'ベトナム' },
      { id: 11, name: 'マレーシア' },
      { id: 12, name: 'ミャンマー' },
      { id: 13, name: 'ラオス' }
    ]
    include ActiveHash::Associations
    has_many :prototypes
  
    end