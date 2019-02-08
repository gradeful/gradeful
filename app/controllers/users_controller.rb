class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      puts 'A new user signed up!'
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
