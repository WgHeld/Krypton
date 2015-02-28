# Krypton
Server to collect all events and to calculate the task scores


## Setup Log

1. Setup rails:

```
rails new Krypton --skip-bundle --skip-git --skip-keeps --skip-sprockets --database=mysql --skip-javascript --skip-turbolinks --skip-test-unit
```

2. Add models:

```
rails g model <Task/Event/User/Device>
```

3. Add columns/attributes, associations, validation


4. Add test suite, rspec factory girl

```
rails generate rspec:install
```
