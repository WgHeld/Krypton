class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :device_reference, null: false
      t.string   :type,             null: false # Enum <start/end>
      t.datetime :created_at,       null: false
      t.string   :user_reference
    end
  end
end
