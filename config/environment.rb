# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Lions::Application.initialize!

Date::DATE_FORMATS.merge!(:default => "%d/%m/%Y")

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app16242298@heroku.com'],
  :password       => ENV['jf7myg5b'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}
