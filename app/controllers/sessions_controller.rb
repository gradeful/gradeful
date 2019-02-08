class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      if user.authenticate(params[:session][:password])
        log_in user
        remember user
        redirect_to '/'
      else
        flash.now[:error] = 'Wrong password.'
        render 'new'
      end
    else
      flash.now[:error] = 'A user with that email doesn\'t exist.'
      render 'new'
    end
  end

  def destroy
    if logged_in?
      log_out
    end
    redirect_to login_path
  end

end
