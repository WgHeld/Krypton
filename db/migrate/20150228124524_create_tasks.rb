class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id,   null: false
      t.integer :device_id, null: false
      t.string  :state,     null: false, default: 'running' # Enum <started/running/finished>
      t.integer :points,    null: false, default: 0
    end
  end
end
