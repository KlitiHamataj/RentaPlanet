puts 'Creating users...'

5.times do
  user = User.create!(
      email: Faker::Internet.email,
      username: Faker::Name.first_name,
      password: 'password',
  )
  user.avatar.attach(io: File.open('app/assets/images/user-astronaut.svg'), filename: 'file.svg', content_type: 'image/svg')
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
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      user: User.find(i + 1),
    )
    planet.photos.attach(io: File.open('app/assets/images/mars.jpeg'), filename: 'file.jpg', content_type: 'image/jpeg')
  end

  puts 'Planets created...'

