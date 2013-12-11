TelephonePictionary::Application.routes.draw do
  
  root to: "storylines#index"
 
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :pictures
  resources :phrases
  resources :storylines
  end