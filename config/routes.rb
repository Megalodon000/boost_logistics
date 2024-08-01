Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  authenticated :user, -> user { user.admin? } do
    root to: 'dashboards#admin', as: :admin_root
  end

  authenticated :user, -> user { user.customer? } do
    root to: 'dashboards#customer', as: :customer_root
  end

  unauthenticated do
    root to: 'acceuil#index'
  end

  resources :bookings
  resources :trackings
  resources :blogs

  namespace :admin do
    get 'trackings/index'
    get 'trackings/show'
    get 'trackings/new'
    get 'trackings/edit'
    get 'bookings/index'
    get 'bookings/show'
    get 'bookings/new'
    get 'bookings/edit'
    get 'blogs/index'
    get 'blogs/show'
    get 'blogs/new'
    get 'blogs/edit'
    resources :users, only: [:index] do
      member do
        patch :approve
      end
    end
    resources :blogs
    resources :bookings
    resources :trackings
  end
end
