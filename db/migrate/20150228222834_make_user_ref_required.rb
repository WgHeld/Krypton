class MakeUserRefRequired < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.change :reference, :string, null: false
    end
  end
end
