TelephonePictionary::Application.routes.draw do
  
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  #match 'auth/:provider/callback', to: 'sessions#create'
  root to: "storylines#index"

  resources :pictures
  resources :phrases
  resources :storylines
  end

 # get "sessions/create"

  # get "sessions/destroy"

  # get "sessions_controller/create"

  # get "sessions_controller/destroy"