class AddConstraints < ActiveRecord::Migration
  def change
    add_index :users,  :reference, :unique => true
    add_index :devices, :reference, :unique => true
  end
end
