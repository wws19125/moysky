class CreateUserConfigs < ActiveRecord::Migration
  def change
    create_table :user_configs do |t|
      t.integer :user_id
      t.string :usernames
      t.string :configs

      t.timestamps
    end
  end
end
