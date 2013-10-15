class ResetPasswordsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user
      @user.reset_password_reset_token!
      url = reset_password_url(:token => @user.password_reset_token, :method => :get)
      msg = UserMailer.reset_password_email(@user, url)
      msg.deliver!
      render :create
    else
      flash.now[:errors] = ["Can't find #{params[:user][:email]}."]
      render :new
    end
  end

  def show
    @user = User.find_by_password_reset_token(params[:token])
    @token = params[:token]
    if @user
      render :show
    else
    end
  end

  def reset
    @user = User.find_by_password_reset_token(params[:token])
    @user.password = params[:user][:password]
    if @user.save
      login_user(@user)
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_session_url
    end

    @user.reset_password_reset_token!
  end
end
