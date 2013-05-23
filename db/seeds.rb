# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([{passport:'admin',dname:'admin',password:'123456',config:'0',email:'wws19125@126.com'},{passport:'admin',dname:'wang',password:'123456',config:'0',email:'ahfywd@126.com'}])
# Weibo.create(user_id:100,body:'sdfasdfasdfas')
