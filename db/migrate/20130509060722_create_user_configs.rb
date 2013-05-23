# -*- coding: utf-8 -*-
class CreateUserConfigs < ActiveRecord::Migration
  def change
    create_table :user_configs do |t|
      t.integer :user_id
      t.string :usernames                  #多用户名
      t.string :friends                   #关注好友
      t.string :configs                    #配置编号

      t.timestamps
    end
  end
end
