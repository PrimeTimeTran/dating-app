class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to users_path
      else
        flash[:errors] = "Wrong password"
        render 'new'
      end
    else
      flash[:errors] = "Email not found"
      render 'new'
    end
  end
end
