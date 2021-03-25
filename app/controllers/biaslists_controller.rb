class BiaslistsController < ApplicationController

  before_action :set_biaslist, only: [:show, :edit, :update, :destroy]
  before_action :set_kpopidol, only: [:new, :show, :edit ]

  def new
   
    @biaslist = @kpopidol.biaslists.build
     render :new

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
     
      render :show
    else
      redirect_to login_path
    end
  end

  def create
   
    @biaslist = Biaslist.new(bias_params)
      @biaslist.save
      redirect_to my_bias_path      
  end

  def edit
    if logged_in?
     
      if  @biaslist.user_id == current_user.id 
          render :edit

      else 
      redirect_to login_path
      end
    end 
  end

  

  def update
  
      @biaslist.update(notes: params[:biaslist][:notes])
      redirect_to my_bias_path
  end

  def destroy
    
    if  @biaslist.user_id == current_user.id
        @biaslist.destroy
        
        redirect_to my_bias_path
    end
    
  end

  private 
  def bias_params
   params.require(:biaslist).permit(:notes,:user_id,:kpopidol_id)
  end 

  def set_biaslist
    @biaslist = Biaslist.find(params[:id])
  end

  def set_kpopidol
    @kpopidol = Kpopidol.find(params[:kpopidol_id])
  end

end
