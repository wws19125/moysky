# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([{passport:'admin',dname:'admin',password:'123456',config:'0',email:'wws19125@126.com'},{passport:'13579',dname:'wang',password:'123456',config:'0',email:'ahfywd@126.com'},{passport:'135792',dname:'王的世界',password:'123456',config:'3',email:'171757937@qq.com'}])
# Weibo.create(user_id:100,body:'sdfasdfasdfas')
UserConfig.create([{user_id:1,friends:"2 3",configs:"0 1"},{user_id:2,configs:"0 1"},{user_id:3,friends:"1 2",configs:"0 1"}])
