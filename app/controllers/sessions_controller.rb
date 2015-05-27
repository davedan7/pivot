class SessionsController < ApplicationController
  def new
  end

  def create
    if request.env['omniauth.auth']
      @user              = User.find_or_create_by_auth(request.env['omniauth.auth'])
      flash[:success]    = "Succsessfully Logged In As #{@user.username}"
      session[:user_id]  = @user.id
      if @cart.contents.empty?
        redirect_to current_user
        else
        redirect_to checkout_path
      end
    else
      @user = User.find_by(email: params[:session][:email])
      if @user && @user.admin? && @user.authenticate(params[:session][:password])
        flash[:success]    = "Succsessfully Logged In As #{@user.username}"
        session[:user_id] = @user.id
        redirect_to admin_dashboard_path
      elsif @user && @user.authenticate(params[:session][:password])
        flash[:success]    = "Succsessfully Logged In As #{@user.username}"
        session[:user_id] = @user.id
        if @cart.contents.empty?
          if @user.role == "business" # This is ugly, but before it was redirecting to the user show page when logged in as a business - and we want it o go to dashboard path
            redirect_to business_dashboard_path
          else
            redirect_to @user
          end
        else
          redirect_to checkout_path
        end
      else
        flash[:danger] = "Invalid Credentials. Please Try Again."
        render :new
      end
    end
  end

  def twitter
    redirect_to '/auth/twitter'
  end

  def destroy
    session.clear
    flash[:success] = "Successfully logged out."
    redirect_to root_path
  end
end
