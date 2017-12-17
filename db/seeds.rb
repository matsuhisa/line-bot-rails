# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

books = [
  {title: "吾輩は猫である", price: 1000},
  {title: "坊っちゃん", price: 2000},
  {title: "草枕", price: 500},
  {title: "二百十日", price: 1200},
  {title: "野分", price: 1300},
  {title: "虞美人草", price: 1200},
  {title: "坑夫", price: 1600},
  {title: "三四郎", price: 1500},
  {title: "それから", price: 900},
  {title: "門", price: 1000},
  {title: "彼岸過迄", price: 2300},
  {title: "行人", price: 3200},
  {title: "こゝろ", price: 890},
  {title: "道草", price: 980},
  {title: "明暗", price: 1800},
]

books.each do |book|
  Book.create(book)
end
