# Preview all emails at http://localhost:3000/rails/mailers/template_mailer
class TemplateMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/template_mailer/template_sent
  def template_sent
    TemplateMailer.template_sent
  end

end
