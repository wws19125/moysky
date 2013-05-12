# -*- coding: utf-8 -*-
class Notifier < ActionMailer::Base
  default from: "wws19125@126.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.amend_password.subject
  #
  def amend_password email="wws19125@126.com",username="null",url="http://www.baidu.com"
    @email=email
    @username = username
    @url = url
    mail to: @email,:subject => "马赛克！修改你的密码"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.notice_info.subject
  #
  def notice_info
    @greeting = "Hi"

    mail to: "to@example.org",:subject => "马赛克!用户信息变更提醒"
  end
end
