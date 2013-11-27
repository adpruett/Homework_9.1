class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created a new user."
      redirect_to users_url
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      flash[:notice] = "Successfully updated user " + @user.first_name
      redirect_to users_url
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully deleted " + @user.first_name + " " + @user.last_name
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email)
  end
end
