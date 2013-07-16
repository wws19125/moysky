class CreateTValues < ActiveRecord::Migration
  def change
    create_table :t_values do |t|
      # t.string :title
      # t.string :_title
      t.string :heads
      t.string :items
      t.references :theader, index: true

      t.timestamps
    end
  end
end
