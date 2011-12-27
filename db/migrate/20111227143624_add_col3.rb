class AddCol3 < ActiveRecord::Migration
  def change
    add_column :tasks,:point_sequence_normalized,:text
  end
end
