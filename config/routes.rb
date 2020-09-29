Rails.application.routes.draw do
  root 'landing_page#top'
  resources :users
  resources :posts
  get '/likes', to: 'posts#likes'
  get    '/login',  to: 'sessions#new'
  post    '/login' , to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy' 
  resources :posts do
    post 'add' ,to: 'likes#create'
    delete '/add' ,to: 'likes#destroy'
  end
  get '/setting', to: 'users#setting'
end
