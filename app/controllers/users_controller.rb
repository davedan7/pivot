class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      UserNotifier.send_signup_email(@user).deliver_now
      flash[:success] = "User has been successfully created!"
      if @cart.contents.empty?
        redirect_to @user
        else
        redirect_to checkout_path
      end
    else
      flash[:danger] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash.now[:success] = "#{@user.username} successfully updated"
      redirect_to @user
    else
      flash[:danger] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      flash[:success] = "Account has been removed"
      redirect_to root_path
    else
      flash[:danger] = @user.errors.full_messages
      render @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :username,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :picture,
                                 :location
                                )
  end
end
