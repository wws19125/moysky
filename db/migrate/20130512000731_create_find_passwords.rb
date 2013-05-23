# -*- coding: utf-8 -*-
class CreateFindPasswords < ActiveRecord::Migration
  def change
    create_table :find_passwords do |t|
      t.string :email,:limit => 50
      t.string :code,:limit => 40    #附加码
      t.datetime :last_time

      t.timestamps
    end
  end
end
