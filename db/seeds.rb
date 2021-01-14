puts 'Creating users...'

5.times do
  User.create!(
      email: Faker::Internet.email,
      username: Faker::Name.first_name,
      password: 'password',
  )
end

puts 'Users created...'

puts 'Creating planets...'

5.times do |i|
    planet = Planet.create!(
      name: Faker::Name.unique.name,
      description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
      address: Faker::Space.galaxy,
      price: Faker::Number.number(digits: 6),
      number_guests: Faker::Number.number(digits: 5),
      user: User.find(i + 1),
    )
    planet.photos.attach(io: File.open('app/assets/images/mars.jpeg'), filename: 'file.jpg', content_type: 'image/jpeg')
  end

  puts 'Planets created...'

