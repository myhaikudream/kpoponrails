class BiaslistsController < ApplicationController

  def new
    @kpopidol = Kpopidol.find(params[:kpopidol_id])
    @biaslist = @kpopidol.biaslists.build
    render :my_bias

  end

  def mybias
    if logged_in?
      @biaslist = current_user.biaslists 
      render :my_bias
    else
      redirect_to login_path
    end
  end

  def show
    if logged_in?
      @kpopidol = Kpopidol.find(params[:kpopidol_id])
      @biaslist = Biaslist.find(params[:id])
      render :show
    else
      redirect_to login_path
    end
  end

  def create
    @biaslist = Biaslist.new(kpopidol_id: params[:kpopidol_id])
      @biaslist.user_id = session[:user_id]
      @biaslist.save
      redirect_to my_bias_path      
  end

  def edit
    if logged_in?
      @kpopidol = Kpopidol.find(params[:kpopidol_id])
      @biaslist = Biaslist.find(params[:id])
      if  @biaslist.user_id == current_user.id 
          render :edit

      else 
      redirect_to login_path
      end
    end 
  end

  

  def update
    @biaslist = Biaslist.find(params[:id])
      @biaslist.update(notes: params[:biaslist][:notes])
      redirect_to my_bias_path
  end

  def destroy
    @biaslist = Biaslist.find(params[:id])
    if  @biaslist.user_id == current_user.id
        @biaslist.destroy
        
        redirect_to my_bias_path
    end
    
  end

  private 
  def review_params
   params.require(:biaslist).permit(:note,:user_id,:kpopidol_id)
  end 

end


