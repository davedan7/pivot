module ApplicationHelper

  def current_admin?
    current_user && current_user.admin?
  end

  def current_business_admin?
    current_user && current_user.business_admin?
  end

  def current_business?
    current_user && current_user.business?
  end

end
