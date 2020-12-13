# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Generating Kind types...'
Kind.create!([{ description: 'Amigos' },
              { description: 'Trabalho' },
              { description: 'Família' },
              { description: 'Restaurantes' }])
puts 'Kind types generated!'

puts 'Generating Contacts ...'
4.times do |_i|
  Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    kind: Kind.all.sample,
    rmk: Faker::Lorem.sentence(word_count: 10)
  )
end
puts 'Contacts generated!'

puts 'Generating Phones ...'
4.times do |_i|
  Phone.create!(
    phone: Faker::PhoneNumber.phone_number,
    contact: Contact.all.sample
  )
end
puts 'Phones generated!'

puts 'Generating Addresses ...'
4.times do |_i|
  Address.create!(
    street: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    contact: Contact.all.sample
  )
end
puts 'Addresses generated!'
