

class UserNotifier < ActionMailer::Base
  def forgot_password(user,current_url)
    setup_email(user,current_url)
    @subject    += 'Reset Password'
    @body[:url]  =  current_url+"/user/reset_password/#{user.reset_password_code}"
  end

  protected
    def setup_email(user, current_url)
      @recipients  = "#{user.email}"
      admin_email = User.find_by_username('admin').email
      admin_email ||= "noreply@#{get_domain(current_url)}"
      @from        = admin_email
      @subject     = " "
      @sent_on     = Time.now
      @body[:user] = user
    end

    def get_domain(current_url)
      url_parts = current_url.split("://").last.split('.')
      url_parts[(url_parts.length - 2) .. (url_parts.length - 1)].join('.')
    end
end