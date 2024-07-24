# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Tag.create([
  { name: '肉系' },
  { name: '海鮮系' },
  { name: '野菜系' },
  { name: '大豆系' },
  { name: '辛い系' },
  { name: 'ふりかけ' },
  { name: '漬物' },
  { name: '佃煮' },
  { name: '塩辛' },
  { name: '缶詰' },
  { name: 'その他' },
])