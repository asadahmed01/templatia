require "test_helper"

class TemplateMailerTest < ActionMailer::TestCase
  test "template_sent" do
    mail = TemplateMailer.template_sent
    assert_equal "Template sent", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
