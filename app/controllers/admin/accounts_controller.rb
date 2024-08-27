class Admin::AccountsController < ApplicationController
  class Admin::AccountsController < Admin::ApplicationController
    def index
      @users = User.where(role: 'customer')
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    def approve
      @user = User.find(params[:id])
      @user.update(approved: true)
      redirect_to admin_accounts_path, notice: 'Customer was successfully approved.'
    end
  
    def reject
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_accounts_path, notice: 'Customer was successfully rejected.'
    end
  end
  
end
