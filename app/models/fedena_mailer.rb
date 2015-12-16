

class FedenaMailer < ActionMailer::Base
  def email(sender,recipients, subject, message)
    recipient_emails = (recipients.class == String) ? recipients.gsub(' ','').split(',').compact : recipients.compact
    setup_email(sender, recipient_emails, subject, message)
  end

  protected
  def setup_email(sender, emails, subject, message)
    @from = sender
    @recipients = emails
    @subject = subject
    @sent_on = Time.now
    @body['message'] = message
  end
  
end
