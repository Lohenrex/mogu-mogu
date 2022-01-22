# frozen_string_literal: true

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: "smtp.sendgrid.net",
  port: "587",
  authentication: :plain,
  user_name: ENV.fetch("smtp_user"),
  password: ENV.fetch("smtp_password"),
  domain: ENV.fetch("smtp_domain"),
  enable_starttls_auto: true
}
