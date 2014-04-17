class AddResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :topic
      t.string :url
      t.integer :user_id
 
      t.timestamps
    end
  end
end