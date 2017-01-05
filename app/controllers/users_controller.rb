class UsersController < ApplicationController
  helper_method :logged_in?

  def new
  end

  def create
      @user = User.new(user_params)
    # if params[:user][:password] == params[:user][:password_confirmation]
    # @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to home_path
      else
        flash[:notice] = "Please enter a name and password"
        redirect_to '/signup'
      end
  end

  

# home, input name and passwords
# login, with name and password
# final page if logged_in

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
    # try without password_confirmation
  end

end
