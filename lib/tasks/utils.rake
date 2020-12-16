namespace :utils do
  desc 'Populate database'
  task seed: :environment do
    puts 'Generating Contacts ...'
    4.times do |_i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.safe_email,
        kind: Kind.all.sample,
        rmk: LeroleroGenerator.sentence([1, 2].sample)
      )
    end
    puts 'Contacts generated!'

    puts 'Generating Phones ...'
    Contact.all.each do |contact|
      Random.rand(1..5).times do |_i|
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    puts 'Phones generated!'

    puts 'Generating Addresses ...'
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: contact
      )
    end
    puts 'Addresses generated!'
  end
end
