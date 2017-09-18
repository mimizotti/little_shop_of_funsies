class Admin::DashboardsController < ApplicationController
before_action :require_admin
  def index
  
    @admin = User.find(current_user.id)
  end

private
  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
