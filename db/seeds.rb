# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

users = [
  {
    name: 'Tobi',
    reference: 'tobi',
    image: 'https://avatars0.githubusercontent.com/u/11243531?v=3&s=100',
  },
  {
    name: 'Christoph',
    reference: 'christoph',
    image: 'https://avatars0.githubusercontent.com/u/11243531?v=3&s=100',
  },
  {
    name: 'Clemens',
    reference: 'clemens',
    image: 'https://avatars0.githubusercontent.com/u/11243531?v=3&s=100',
  },
  {
    name: 'Roby',
    reference: 'roby',
    image: 'https://avatars0.githubusercontent.com/u/11243531?v=3&s=100',
  }
]

devices = [
  {
    name:        'Dishwasher',
    reference:   '89287aad-db10-4303-ad01-5547c67eca96',
    strategy:    'countdown',
    image:       'http://t3.gstatic.com/images?q=tbn:ANd9GcSxdYV6YeCOB6CCtEczivBP573mcbMKnMG4IoO1iNT0AKwANxFrZNX4XdA',
    description: 'Empty Dishwasher',
  },
  {
    name:        'Trash',
    reference:   '103156b3-1a78-42c2-a4af-1512721ded3d',
    strategy:    'countdown',
    image:       'http://t1.gstatic.com/images?q=tbn:ANd9GcTXmUU09CpSaaohXg2-dgtDsB-IP_UunGvfm_laRggjFhUqjxasXsBIuw',
    description: 'Empty Trash',
  }
]

users_cache = User.all
users.each do |data|
  user           = users_cache.find { |d| d.name == data[:name] } || User.new
  user.name      = data[:name]
  user.reference = data[:reference]
  user.image     = data[:image]
  user.save!
end

devices_cache = Device.all
devices.each do |data|
  device             = devices_cache.find { |d| d.name == data[:name] } || Device.new
  device.name        = data[:name]
  device.reference   = data[:reference]
  device.strategy    = data[:strategy]
  device.image       = data[:image]
  device.description = data[:description]
  device.save!
end
