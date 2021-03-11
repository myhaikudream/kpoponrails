class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
  end

  def show 
    @group = Group.find(params[:id])
  end

  def main_group
    @groups = Group.main_group
    render :index 

  end

  def recommended_groups
    @groups = Group.recommended_groups
  end

  
    




end
