# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

users = [
  {
    name: 'Tobi',
    reference: 'tobi',
    image: 'tobi.jpg',
  },
  {
    name: 'Christoph',
    reference: 'christoph',
    image: 'chris.jpg',
  },
  {
    name: 'Clemens',
    reference: 'clemens',
    image: 'cle.jpg',
  },
  {
    name: 'Roby',
    reference: 'roby',
    image: 'roby.jpg',
  }
]

devices = [
  {
    name:        'Dishwasher',
    reference:   '89287aad-db10-4303-ad01-5547c67eca96',
    strategy:    'countdown',
    image:       'dishwasher.png',
    description: 'Empty Dishwasher',
  },
  {
    name:        'Washmachine',
    reference:   'f4ab513e-590d-494f-8586-2e06af2d186d',
    strategy:    'countdown',
    image:       'wash.png',
    description: 'Empty Washmachine',
  },
  {
    name:        'Trash',
    reference:   '103156b3-1a78-42c2-a4af-1512721ded3d',
    strategy:    'countdown',
    image:       'trash.png',
    description: 'Empty Trash',
  },
  {
    name:        'Hover',
    reference:   'a2e4d803-82d2-4504-add2-8e99111d9178',
    strategy:    'duration',
    image:       'mop.png',
    description: 'Hover Action On',
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
