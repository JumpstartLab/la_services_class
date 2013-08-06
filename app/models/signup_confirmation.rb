class SignupConfirmation
  def self.create(user)
    data = {"name" => user.full_name, "email" => user.email}
    Mailer.welcome_email(data).deliver
  end
end