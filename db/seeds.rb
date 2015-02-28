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
  reference: 'dw',
  strategy:  'onetime',
})
