# -*- coding: utf-8 -*-
class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :comment_id,:default => -1   #上一级评论
      t.integer :commenter     #谁评论的
      t.integer :weibo_id      #评论哪一条
      t.string :body           #评论内容
      t.timestamps             #
    end
  end
end
