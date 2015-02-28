class UpdateTask < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.change   :user_id,     :integer, null: true
      t.datetime :started_at,  null: false
      t.datetime :finished_at, null: true
    end
  end
end
