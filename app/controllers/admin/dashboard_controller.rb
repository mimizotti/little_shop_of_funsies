class Admin::DashboardController < ApplicationController
before_action :require_admin
  def index
    if params[:status] == "ordered" || params[:status] == "paid" || params[:status] == "cancelled" || params[:status] == "completed"
      @orders = Order.filter_by_status(params[:status])
    else
      @orders = Order.all
    end
  end

private
  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
