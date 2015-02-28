# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create({
  name: 'Tobi',
})

User.create({
  name: 'Christoph',
})

User.create({
  name: 'Clemens',
})

User.create({
  name: 'Roby',
})

Device.create({
  name:      'Dishwasher',
  reference: '89287aad-db10-4303-ad01-5547c67eca96',
  strategy:  'countdown',
})

Device.create({
  name:      'Trash',
  reference: '103156b3-1a78-42c2-a4af-1512721ded3d',
  strategy:  'countdown',
})


