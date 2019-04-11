class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to home_path
    else
      render :new
    end
  end

  def create
    if (auth = request.env["omniauth.auth"])
      user = User.find_by_provider_and_id(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
        log_in user
        redirect_back_or home_path
    else
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember] == "1" ? remember(user) : forget(user)
        redirect_back_or home_path
      else
        flash.now[:danger] = t("sessions.new.invalid_login")
        render :new
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
