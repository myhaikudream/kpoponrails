class KpopidolsController < ApplicationController

  def index
    @kpopidols = Kpopidol.all 
    render :index 
  end

  def show
    @kpopidol = Kpopidol.find(params[:id])
  end


end
