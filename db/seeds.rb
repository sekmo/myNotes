# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
case Rails.env
when 'development'
  User.create(email: "francescojjmari@gmail.com", password: "francesco")
  50.times do
    Note.create(
      date: rand(2.years).seconds.ago,
      title: Faker::Hipster.sentence,
      content: Faker::Hipster.paragraphs(5).join("\n"),
      user: User.find(1)
    )
  end
when 'test'
  # test-specific seeds ...
  # (Consider having your tests set up the data they need
  # themselves instead of seeding it here!)

when 'production'
  # production seeds (if any) ...

end
