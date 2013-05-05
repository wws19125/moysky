class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :PID,:default => -1
      t.integer :weibo_id
      t.string :body

      t.timestamps
    end
  end
end
