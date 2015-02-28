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
rails g factory_girl:model device
rails g factory_girl:model task
```

5. add event processing to controller


6. add client code
  - add haml
  - add sass
  - add backbone `rails generate backbone:install`
  - js template: http://www.embeddedjs.com/


7. sources:
    - circular images: http://bavotasan.com/2011/circular-images-with-css3/
