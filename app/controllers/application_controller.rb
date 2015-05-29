class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ActionView::Helpers::TextHelper


  before_action :load_cart
  before_action :categories
  before_action :load_categories
  helper_method :current_user
  helper_method :logged_in?
  helper_method :current_business_admin?
  helper_method :current_admin?
  helper_method :current_business?
  helper_method :current_owner?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_business?
    current_user && current_user.business?
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def current_business_admin?
    current_user && current_user.business_admin?
  end

  def current_owner
    job.find_by(id: params[:id]).user_id == current_user.employer_id
  end

  def logged_in?
    !current_user.nil?
  end

  def load_cart
    @cart ||= Cart.new(session[:cart])
  end

  def load_categories
    @categories ||= Category.all
  end

  def categories
    Category.all
  end

end
