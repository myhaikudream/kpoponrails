class SessionsController < ApplicationController

    def welcome
        
    end

    def new
        @user = User.new
        
    end

    def create 
        @user = User.find_by(username:params[:username])
        if !@user
          @error = "Are you sure that's your username?"
          render :new
        elsif !@user.authenticate(params[:password])
          @error =  "Password no matchy records"
          render :new  
        else 
          session[:user_id] = @user.id
          redirect_to groups_path 
        end 
    end

    def google 
    
      user = User.find_or_create_by(username: auth["info"]["name"], uid: auth["uid"]) do |user|
          user.password = SecureRandom.hex(10)
         
      end
    

      if user
          session[:user_id] = user.id  
          redirect_to groups_path
      else
          
          redirect_to login_path
      end
     
  end

  def destroy 
      session.delete(:user_id)
      redirect_to login_path
  end

  

  private 

  def auth 
      request.env['omniauth.auth']
  end


   

end




