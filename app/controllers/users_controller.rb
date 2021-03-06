class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    if current_user.nil?
      redirect_to login_path
    else
      @user = current_user
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to '/'
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user)
            .permit(:name, :email, :password, :password_confirmation)
    end

end
