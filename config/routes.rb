TelephonePictionary::Application.routes.draw do
  
  #match 'auth/:provider/callback', to: 'sessions#create'
  root to: "storylines#index"

  resources :pictures
  resources :phrases
  resources :storylines
  end
