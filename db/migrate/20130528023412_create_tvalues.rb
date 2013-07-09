# -*- coding: utf-8 -*-
class CreateTvalues < ActiveRecord::Migration
  def change
    # 值表
    create_table :tvalues do |t|
      t.integer :t_id   # 表格
      t.integer :user_id    #用户id
      t.string :title    #标题
      t.string :_title   #副标题
      t.string :heads    #头
      t.string :items    #字段            值

      t.timestamps
    end
  end
end
