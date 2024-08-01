class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def admin
    @pending_users = User.where(approved: false)
    @blogs = Blog.all
    @bookings = Booking.all
    @trackings = Tracking.all
  end

  def customer
  end
end
