TelephonePictionary::Application.routes.draw do
  
  resources :posts

  get "tests/index"

  root to: "storylines#index"
 
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  #get 'new_story', to: 'storylines#new'
  #get 'storylines/new_story', as: 'new_story'

  post "phrases/create"
  post "pictures/create"
  post "storylines/create"
  post "players/create"
  resources :pictures
  resources :phrases
  resources :storylines
  resources :players
  end