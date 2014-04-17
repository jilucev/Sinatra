class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :ratings, :ratings, :stars
  end
end
