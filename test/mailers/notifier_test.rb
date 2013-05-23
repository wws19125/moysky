require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "amend_password" do
    mail = Notifier.amend_password
    assert_equal "Amend password", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notice_info" do
    mail = Notifier.notice_info
    assert_equal "Notice info", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
