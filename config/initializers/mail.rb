ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: 'goodcoffeebygoodbarista@gmail.com',
  password: 'password1019!',
  authentication: 'plain',
  enable_starttls_auto: true
}