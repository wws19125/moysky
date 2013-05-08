# -*- coding: utf-8 -*-
class Weibo < ActiveRecord::Base
  #attr_accessor :thumb_count,:comment_count,:
  default_scope order 'created_at desc'
  has_many :comments # ,:dependent=>:destroy
  has_one :weibo
  belongs_to :weibo
  
  #=虚拟属性
  # 被赞次数
  #def thumbs_count
   # 0
  #end
  
  # 评论次数
  def comments_count
    self.comments.count
  end
  
  # 转发次数
  def share_count
    Weibo.where("weibo_id="+self.id.to_s).count
  end

end
