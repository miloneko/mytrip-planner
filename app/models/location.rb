class Location < ActiveHash::Base
  self.data = [
    { id: 1, name: '日本' },
    { id: 2, name: 'アジア' },
    { id: 3, name: '北米' },
    { id: 4, name: '南米' },
    { id: 5, name: '中東' },
    { id: 6, name: 'アフリカ' },
    { id: 7, name: 'ヨーロッパ' },
    { id: 8, name: 'オセアニア' }
  ]
end
