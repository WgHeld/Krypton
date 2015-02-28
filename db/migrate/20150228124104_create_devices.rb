class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name,      null: false
      t.string :reference, null: false
      t.string :strategy,  null: false #Enum <countdown/duration/onetime>
    end
  end
end
