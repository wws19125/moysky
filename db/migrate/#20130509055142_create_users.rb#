class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :passport
      t.string :dname,:limit=>20
      t.string :password,:limit => 16
      t.string :config

      t.timestamps
    end
  end
end
