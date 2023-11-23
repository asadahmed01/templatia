Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "templates#index"
  resources :templates do
    member do
      post 'add_to_cart', to: 'templates#add_to_cart'
    end
    collection do
      get 'cart', to: 'templates#cart'
    end
  end 
end
