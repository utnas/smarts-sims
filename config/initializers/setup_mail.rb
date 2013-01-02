#config.action_mailer.raise_delivery_errors = true
# set delivery method to :smtp, :sendmail or :test
#config.action_mailer.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
    :address => 'zcs.smartesting.com',
    :ssl => true,
    :port => 465,
    :domain => 'zcs.smartesting.com',
    :user_name => "dooley.nsewolo@smartesting.com",
    :password => "Mfv2tlm2",
    :authentication => "login",
    :enable_starttls_auto => true
}