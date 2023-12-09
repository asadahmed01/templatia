class TemplateMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.template_mailer.template_sent.subject
  #
  def template_sent
    @user = params[:user_hash]
    template_id = @user[:template_id].to_i
    @template = Template.find(template_id)
    mail(to: @user_hash[:email], subject: 'Your resume template is ready')
  end
end
