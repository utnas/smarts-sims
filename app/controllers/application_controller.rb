class ApplicationController < ActionController::Base
  protect_from_forgery :except => :destroy
  before_filter :require_login

  protected
  def not_authenticated
    redirect_to login_path, :alert => "Please login first."
  end

  def admin_required
    user = User.find_by_id(session[:user_id])
    unless user and user.admin?
      redirect_to(:login, :notice => 'Logged out!')
    end
  end
end
