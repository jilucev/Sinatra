class AddColumnToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :review, :text
  end
end
