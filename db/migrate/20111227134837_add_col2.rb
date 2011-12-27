class AddCol2 < ActiveRecord::Migration
  def change
    add_column :tasks,:point_sequence,:text
  end
end
