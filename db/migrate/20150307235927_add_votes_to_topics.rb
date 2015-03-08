class AddVotesToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :votes, :integer, null: false, default: 0
  end
end
