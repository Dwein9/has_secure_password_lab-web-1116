class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to home_path
      else
        redirect_to login_path
      end
  end

  def destroy
    session.reset
    redirect_to home_path
  end

end
