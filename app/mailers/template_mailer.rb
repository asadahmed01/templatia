class TemplateMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.template_mailer.template_sent.subject
  #
  def template_sent
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
