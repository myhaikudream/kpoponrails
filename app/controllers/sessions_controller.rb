class SessionsController < ApplicationController

    before_action :redirect_if_logged_in

    def welcome
    end

    def new
        @user = User.new
        redirect_to groups_path
    end

    def create 
     u = User.find_by_username(params[:user][:username])
        if u && u.authenticate(params[:user][:password])
            session[:user_id] = u.id
            redirect_to user_path(u)
        else
            flash[:message] = "This account cannot be found! Please try again."
            redirect_to login_path
        end
    end

    def omniauth 
        user = User.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
            u.email = auth["info"]["email"]
            u.password = SecureRandom.hex
            u.username = auth["info"]["email"]
        end

        
        if user.valid? 
            session[:user_id] = user.id   
            redirect_to user_path(user)
        else
            flash[:message] = "Something isn't quite right!"
            redirect_to login_path
        end
       
    end

    def destroy 
        session.delete(:user_id)
        redirect_to login_path
    end

    
    def auth 
        request.env['omniauth.auth']
    end

end
