class CreateTheaders < ActiveRecord::Migration
  def change
    create_table :theaders do |t|
      t.integer :user_id
      t.integer :direction
      t.string :title
      t.string :_title
      t.string :heads
      t.string :items
      t.integer :length
      t.string :intro
      t.integer :type

      t.timestamps
    end
  end
end
