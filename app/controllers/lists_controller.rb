class ListsController < ApplicationController

  def index
    @lists = List.all
    @lists = List.where(:user_id => current_user)
    # @user = User.find(current_user.id)
    # @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new(:list_id => params[:id])
  end

  def new
    if @user = current_user 
      @list = List.new(:user_id => current_user.id)
    else
      flash[:alert] = "Why you no have user account?! ლ(ಠ益ಠლ) Please make one."
    redirect_to :root
    end
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Your list has been saved."
    redirect_to @list
    else
     render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end   

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
     flash[:notice] = "list updated"
     redirect_to @list
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "list deleted"
    redirect_to lists_path
  end  
       


  private

  def list_params
    params.require(:list).permit(:name, :user_id)
  end    
end    
