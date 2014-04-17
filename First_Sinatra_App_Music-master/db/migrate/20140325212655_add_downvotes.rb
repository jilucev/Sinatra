class AddDownvotes < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :song_id
      t.integer :ratings
      t.timestamps
    end
  end
end
