# -*- coding: utf-8 -*-
class CreateTheaders < ActiveRecord::Migration
  def change
    create_table :theaders do |t|
      t.integer :user_id
      t.integer :direction,:default => 0    # 表格方向 默认为竖向 0 竖向 1 横向
      t.string :title           # 表格标题
      t.string :_title          # 副标题
      t.string :heads           # 日期时间等
      t.string :items           # 表项
      # t.integer :length         # 长度
      t.string :intro           # 介绍
      t.integer :ttype,:default => 0          # 类型 0 公共 1 私人

      t.timestamps
    end
  end
end
