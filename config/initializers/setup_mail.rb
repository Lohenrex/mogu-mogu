# frozen_string_literal: true

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: "smtp.sendgrid.net",
  port: "587",
  authentication: :plain,
  user_name: "app246321565@heroku.com",
  password: "rf3t6s8l0251",
  domain: "heroku.com",
  enable_starttls_auto: true
}
