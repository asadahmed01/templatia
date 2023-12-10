Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "templates#index"
  
  resources :templates do
    member do
      post 'add_to_cart', to: 'templates#add_to_cart'
      delete 'remove_from_cart', to: 'templates#remove_from_cart'
    end
    member do
      get 'download'
    end
    collection do
      get 'cart', to: 'templates#cart'
    end
  end

  post 'webhook', to: 'webhooks#receive'

  resources :webhooks, only: [:create]
  resources :checkouts, only: [:new, :create] do
    collection do
      get :success
    end
  end
end
