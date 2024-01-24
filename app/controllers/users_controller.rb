class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
     @user = User.find(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introbuction)
  end
end