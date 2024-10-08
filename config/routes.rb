Rails.application.routes.draw do
  post "hello", to: "game_state_events#hello" # for testing (a button with post messod is shown in game_state_events#home view)

  resources :steam_accounts, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  post "game_event", to: "game_state_events#game_event"
  root "steam_accounts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
