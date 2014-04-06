require 'gmail'

class MailWrapper

  attr_reader :gmail
  def initialize
    @gmail = Gmail.connect!(ENV['GMAIL_USER'], ENV['GMAIL_PASSWORD'])
    gmail.login
  end

  def count
    all_mail.count
  end

  def logged_in?
    gmail.logged_in?
  end

  def search(*args)
    all_mail.emails(*args)
  end

  private

  def all_mail
    @all_mail ||= gmail.mailbox('[Gmail]/All Mail')
  end
end
