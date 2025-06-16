# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@example.com',
  password: 'password'
)

Genre.create!(
  name: "ケーキ"
)

# バナナケーキ
Item.create!(
  name: "バナナケーキ",
  description: "バナナの甘さがたっぷり詰まった、ふわふわのケーキです。",
  price_excluding_tax: 1200,
  genre_id: 1,
  sales_status: true,
  image: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('app/assets/images/bananacake.jpg')),
    filename: 'bananacake.jpg'
  )
)

# チョコケーキ
Item.create!(
  name: "チョコケーキ",
  description: "濃厚なチョコレートの風味が広がる、大人気のケーキです。",
  price_excluding_tax: 1500,
  genre_id: 1,
  sales_status: true,
  image: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('app/assets/images/chococake.jpg')),
    filename: 'chococake.jpg'
  )
)

# ストロベリーケーキ
Item.create!(
  name: "ストロベリーケーキ",
  description: "季節のいちごをたっぷり使用した、華やかなケーキです。",
  price_excluding_tax: 1800,
  genre_id: 1,
  sales_status: true,
  image: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('app/assets/images/stroberycake.jpg')),
    filename: 'stroberycake.jpg'
  )
)

# マカロンケーキ
Item.create!(
  name: "マカロンケーキ",
  description: "カラフルなマカロンを贅沢に使用した、おしゃれなケーキです。",
  price_excluding_tax: 2000,
  genre_id: 1,
  sales_status: true,
  image: ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join('app/assets/images/makaroncake.jpg')),
    filename: 'makaroncake.jpg'
  )
)