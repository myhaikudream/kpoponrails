class BiaslistsController < ApplicationController

  def index
    if logged_in?
      @biaslist = current_user.biaslists 
      render :index
    else
      redirect_to login_path
    end
  end

  def show
    if logged_in?
      @kpopidol = Kpopidol.find(params[:id])
      render :new
    else
      redirect_to login_path
    end
  end

  def new 
    @biaslist = Biaslist.new(params)
      @biaslist.user_id = session[:user_id]
      @biaslist.save
      redirect_to biaslists_path
  end

  def edit
    if logged_in?
      @kpopidol = Kpopidol.find(params[:idol_id])
      @biaslist = Biaslist.find(params[:id])
      if  @biaslist.user_id == current_user.id 
          render :edit
       else  
           redirect_to biaslists_path
       end

      else 
      redirect_to login_path
      end
    end 
  

  def update
    @biaslist = Biaslist.find(params[:id])
      @biaslist.update(notes: params[:notes])
      redirect_to biaslists_path
  end

  def delete
    @biaslist = Biaslist.find(params[:id])
    if  @biaslist.user_id == current_user.id 
        @biaslist.destroy 
        redirect_to biaslists_path
     else  
         redirect_to biaslists_path
     end
  end

end


