module ApplicationHelper
	
	def user_logged?
      !session[:user_id].nil?
    end

    def admin_logged?
      user = User.find_by_id(session[:user_id])
      user.admin?
  	end
end
