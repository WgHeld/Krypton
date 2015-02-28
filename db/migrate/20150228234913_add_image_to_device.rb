class AddImageToDevice < ActiveRecord::Migration
  def change
    change_table :devices do |t|
      t.string :image
      t.string :description
    end
  end
end
