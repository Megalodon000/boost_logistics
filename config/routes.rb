Rails.application.routes.draw do
  devise_for :users

  # Redirects based on user roles
  authenticated :user, ->(u) { u.admin? } do
    root to: 'admin/dashboards#index', as: :admin_root
  end

  authenticated :user, ->(u) { u.customer? && u.approved? } do
    root to: 'customer/dashboards#index', as: :customer_root
  end

  unauthenticated do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end

  # Admin Dashboard Routes
  namespace :admin do
    resources :dashboards, only: [:index]
    resources :blogs
    resources :bookings, only: [:index, :show, :update, :destroy]
    resources :trackings, only: [:index, :show, :create, :update]
    resources :accounts, only: [:index, :update, :destroy]
  end

  # Customer Dashboard Routes
  namespace :customer do
    resources :dashboards, only: [:index]
    resources :bookings, only: [:new, :create, :index, :show]
    resources :trackings, only: [:index, :show]
  end

  # This is where you can add other routes specific to your application
end
