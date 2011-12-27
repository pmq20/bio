class AddCol < ActiveRecord::Migration
  def change
    add_column :tasks,:title,:string
    add_column :tasks,:memo,:text
  end
end
