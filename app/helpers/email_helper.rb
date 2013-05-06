module EmailHelper
  def partial_email(email)
    token, domain = email.split('@')
    "#{token[0..1]}[...]@#{domain}"
  end
end
