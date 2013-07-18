# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  has_one :UserConfig                     #用户配置
  # virutal attributes
  
  # 关注朋友
  def friends
    userConfig.friends
  end
end

