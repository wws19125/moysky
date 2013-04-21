class CreateWeibos < ActiveRecord::Migration
  def change
    create_table :weibos do |t|
      t.integer :weiboid,:null =>false
      t.integer :userid,:null =>false
      t.string :body,:null =>false
      t.integer :pid,:default =>-1
      t.integer :btype,default = 0

      t.timestamps
    end
  end
end
