# -*- coding: utf-8 -*-
class CreateWeibos < ActiveRecord::Migration
  def change
    create_table :weibos do |t|
      # instead by id(auto increment
      # t.integer :weiboid,:null =>false
      t.integer :userid,:null =>false    # who
      t.string :body,:null =>false       # 内容
      t.integer :weibo_id,:default =>-1       #转发
      t.integer :btype,:default => 0     #内容类型 图片 文字 （音乐，视频)  
      t.integer :thumbs_count,:default => 0 #被赞次数

      t.timestamps
    end
  end
end
