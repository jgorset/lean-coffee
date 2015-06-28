class AddArchivedToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :archived, :boolean, default: false, null: false
  end
end
