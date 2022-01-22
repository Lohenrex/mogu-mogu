# frozen_string_literal: true

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: "smtp.sendgrid.net",
  port: "587",
  authentication: :plain,
  user_name: ENV.fetch("smtp_user", "zam"),
  password: ENV.fetch("smtp_password", "secret"),
  domain: ENV.fetch("smtp_domain", "shrek"),
  enable_starttls_auto: true
}
