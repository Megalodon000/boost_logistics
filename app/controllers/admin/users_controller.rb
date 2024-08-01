class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @pending_users = User.where(approved: false)
  end

  def approve
    user = User.find(params[:id])
    user.update(approved: true)
    redirect_to admin_users_path, notice: "User approved."
  end

  private

  def authenticate_admin!
    redirect_to root_path, alert: "Access denied." unless current_user.admin?
  end
end
