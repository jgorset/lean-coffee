class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.string :slug

      t.timestamps null: false
    end

    add_reference :topics, :room, index: true, foreign_key: true
  end
end
