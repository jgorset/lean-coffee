class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.string :description
      t.string :slug, null: false

      t.timestamps null: false
    end

    add_index :rooms, :slug, unique: :true
    add_reference :topics, :room, index: true, foreign_key: true
  end
end
