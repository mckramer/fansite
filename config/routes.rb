Omniauth::Application.routes.draw do
  
  match 'about' => 'pages#about'
  match 'contact' => 'pages#contact'
  
  match '/auth/:provider/callback', to: 'authentications#create'
  
  root :to => 'pages#home'
  
end
