Rails.application.routes.draw do
  root 'landing_page#top'
  resources :users
  resources :posts
  get    '/login',  to: 'sessions#new'
  post    '/login' , to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy' 
end
