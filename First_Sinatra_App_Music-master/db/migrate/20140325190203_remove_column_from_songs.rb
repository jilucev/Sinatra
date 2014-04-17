class RemoveColumnFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :total_votes, :integer
  end
end
