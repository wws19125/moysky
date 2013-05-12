# -*- coding: utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :passport                 # 通行证
      t.string :dname,:limit=>20          #登录名,默认的用户
      t.string :password,:limit => 16      
      t.string :config                # 配置文件
      t.string :email,:limit => 40,:null => false,:uniquess => true    # email 
      t.timestamps
    end
  end
end
