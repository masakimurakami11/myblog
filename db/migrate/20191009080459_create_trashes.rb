class CreateTrashes < ActiveRecord::Migration[5.2]
  def change
    create_table :trashes do |t|
      t.string "text"
      t.string "image"
      t.integer "user_id"
      t.timestamps null:true
    end
  end
end
