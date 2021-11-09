# Registrations Controller
class RegistrationsController < ApplicationController
  # instantiates new user
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.permissions << Permission.find('2')
    @user.permissions << Permission.find('3')
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_later
      # stores saved user id in a session
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account'
    else
      render :new
    end
  end

  private

  def user_params
    # strong parameters
    params.require(:user).permit(:email, :password, :password_confirmation, :login, :name)
  end
end
