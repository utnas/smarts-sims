class SimsMailer < ActionMailer::Base

	def creation_confirmation(user)
		@user = user

	    @recipients = [user.email]
	    @cci = ['nsewolo@yahoo.fr']
	    @from = 'eddie.jaffuel@smartesting.com'
	    @subject = 'Creation of account'
	    @sent_on = Time.now
	    @headers = {'Account creation' => 'Creation of your requested account'}
	    mail(:from => @from, :to => @recipients, :subject => @subject, :cci => @cci)
	end

end
