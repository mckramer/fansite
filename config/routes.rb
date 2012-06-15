Fansite::Application.routes.draw do
  
  resources :events
  match 'events/category/:category' => 'events#index'
  resources :locations
  resources :posts
  resources :registrations, :only => [:new, :create]
  resources :users, :except => [:new, :create, :destroy]
  
  resources :media
  match 'media/type/:form' => 'media#index'
  
  # resources :media_providers
  
  # event_calendar
  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  
  match 'about' => 'pages#about', as: 'about'
  match 'contact' => 'pages#contact', as: 'contact'
  match 'locales' => 'pages#locales', as: 'locales'
  match 'translations' => 'pages#translations', as: 'translations'
  match 'updates' => 'pages#updates', as: 'updates'
  match 'profile(/:username)' => 'users#show', as: 'profile'
  
  match '/auth/:provider/callback', to: 'authentications#create'
  match '/auth/failure', to: 'authentications#failed'
  match 'logout', to: 'authentications#destroy', as: 'logout'
  
  root :to => 'pages#home'
  
end
