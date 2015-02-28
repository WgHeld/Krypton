# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

users = [
  {
    name: 'Tobi',
    reference: 'tobi',
  },
  {
    name: 'Christoph',
    reference: 'christoph',
  },
  {
    name: 'Clemens',
    reference: 'clemens',
  },
  {
    name: 'Roby',
    reference: 'roby',
  }
]

devices = [
  {
    name:      'Dishwasher',
    reference: '89287aad-db10-4303-ad01-5547c67eca96',
    strategy:  'countdown',
  },
  {
    name:      'Trash',
    reference: '103156b3-1a78-42c2-a4af-1512721ded3d',
    strategy:  'countdown',
  }
]

users_cache = User.all
users.each do |data|
  user           = users_cache.find { |d| d.name == data[:name] } || User.new
  user.name      = data[:name]
  user.reference = data[:reference]
  user.save!
end

devices_cache = Device.all
devices.each do |data|
  device           = devices_cache.find { |d| d.name == data[:name] } || Device.new
  device.name      = data[:name]
  device.reference = data[:reference]
  device.strategy  = data[:strategy]
  device.save!
end
