Omniauth::Application.routes.draw do
  
  resources :events
  resources :posts
  resources :registrations, :only => [:new, :create]
  resources :users, :except => [:new, :create, :destroy]
  
  resources :media
  match 'media/type/:form', to: 'media#index'
  
  # resources :media_providers
  
  match 'about' => 'pages#about', as: 'about'
  match 'contact' => 'pages#contact', as: 'contact'
  match 'updates' => 'pages#updates', as: 'updates'
  match 'profile(/:username)' => 'users#show', as: 'profile'
  
  match '/auth/:provider/callback', to: 'authentications#create'
  match '/auth/failure', to: 'authentications#failed'
  match 'logout', to: 'authentications#destroy', as: 'logout'
  
  root :to => 'pages#home'
  
end
