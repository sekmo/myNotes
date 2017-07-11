# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


50.times do
  Note.create(date: rand(2.years).seconds.ago, title: FFaker::Book.title, content: FFaker::BaconIpsum.paragraphs.join('\n'), user: User.find(1))
end
