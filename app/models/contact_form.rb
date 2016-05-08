class ContactForm < MailForm::Base
  attribute :contact_name,      :validate => true
  attribute :contact_email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :contact_comments,       :validate => true
  attributes :nickname,   :captcha => true

  append :remote_ip, :user_agent

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Contacto - #{contact_name}",
      :to => "mariu@mamiamiga.com",
      :from => %("#{contact_name}" <#{contact_email}>)
    }
  end
end
