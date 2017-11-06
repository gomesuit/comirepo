# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

author = Author.create!(name: 'name')
Item.create!(title: 'title', detail_page_url: 'detail_page_url', asin: 'asin', author: author, publication_date: Date.new, introduction: 'introduction')
