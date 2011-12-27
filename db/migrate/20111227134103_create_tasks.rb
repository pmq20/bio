class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :sequence
      t.integer :a
      t.integer :t
      t.integer :c
      t.integer :g
      t.integer :user_id

      t.timestamps
    end
  end
end
