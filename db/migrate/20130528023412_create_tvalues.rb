class CreateTvalues < ActiveRecord::Migration
  def change
    create_table :tvalues do |t|
      t.integer :t_id
      t.string :title
      t.string :_title
      t.string :heads
      t.string :items

      t.timestamps
    end
  end
end
