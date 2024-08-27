class Customers::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_customer_approved

  def index
    # Customer dashboard logic here
  end

  private

  def ensure_customer_approved
    unless current_user.approved?
      sign_out current_user
      redirect_to new_user_session_path, alert: "Your account is not approved yet. Please wait for admin approval."
    end
  end
end
