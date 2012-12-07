class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]

    def new
      @user = User.new
    end

    def create
      respond_to do |format|
        user = login params[:username], params[:password]
        unless user then
          temp_user =  User.find_by_email(params[:username])
          if temp_user
            user = login temp_user.username, params[:password]
          end
        end
        if user
          session[:user_id] = user.id
          format.html { redirect_back_or_to(inhabitants_path, :notice => 'Login successful.') }
          format.xml { render :xml => @user, :status => :created, :location => @user }
        else
          format.html { redirect_to(:login, :notice => 'Logged out!') }
          format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end

    def destroy
      session[:user_id] = nil
      logout
      redirect_to(:login, :notice => 'Logged out!')
    end
end
