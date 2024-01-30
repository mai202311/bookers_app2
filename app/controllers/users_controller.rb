class UsersController < ApplicationController
  def index
     @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(user.id)
    else
       flash[:notice] = "error:You failed to post."
       render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introbuction)
  end
end