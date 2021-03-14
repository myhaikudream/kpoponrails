class UsersController < ApplicationController
     

  def new
    @user = User.new
   
  end

  def create
      @user = User.new(user_params)
      if @user.save 
          session[:user_id] = @user.id
          redirect_to groups_path
      else
          render :new
      end 
    end
  end
  
  def profile

  end




private 
def user_params
  params.require(:user).permit(:username,:password)
end 

def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to login_path
end

