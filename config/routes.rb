Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  authenticated :user, -> user { user.admin? } do
    root to: 'admin/dashboards#admin', as: :admin_root
  end

  authenticated :user, -> user { user.customer? } do
    root to: 'customer/dashboards#customer', as: :customer_root
  end

  unauthenticated do
    root to: 'acceuil#index'
  end

  resources :bookings
  resources :trackings
  resources :blogs

  namespace :admin do
    get 'dashboard', to: 'dashboards#admin', as: :dashboard

    resources :trackings, only: [:index, :show, :new, :edit]
    resources :bookings, only: [:index, :show, :new, :edit]
    resources :blogs, only: [:index, :show, :new, :edit]

    resources :users, only: [:index] do
      member do
        patch :approve
      end
    end
  end
end
