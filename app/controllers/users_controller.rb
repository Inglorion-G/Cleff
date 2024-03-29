class UsersController < ApplicationController
  def show
    @user = current_user
    render :show
  end
  
  def new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
  
end
