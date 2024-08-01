# app/controllers/admin/dashboards_controller.rb
class Admin::DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def admin
    case params[:section]
    when 'accounts'
      @accounts = User.all
    when 'bookings'
      @bookings = Booking.all
    when 'trackings'
      @trackings = Tracking.all
    when 'blogs'
      @blogs = Blog.all
    else
      @blogs = Blog.all
    end
  end

  private

  def authorize_admin
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end
end
