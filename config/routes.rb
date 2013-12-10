TelephonePictionary::Application.routes.draw do
  
  get "sessions/create"

  get "sessions/destroy"

  get "sessions_controller/create"

  get "sessions_controller/destroy"

  #match 'auth/:provider/callback', to: 'sessions#create'
  root to: "storylines#index"

  resources :pictures
  resources :phrases
  resources :storylines
  end
